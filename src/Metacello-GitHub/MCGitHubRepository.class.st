"

"
Class {
	#name : #MCGitHubRepository,
	#superclass : #MCGitBasedNetworkRepository,
	#classVars : [
		'CacheDirectory',
		'DownloadCache',
		'ETagsCache'
	],
	#category : #Metacello-GitHub,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>basicDescription [
  ^ 'github'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>basicFromUrl: aZnUrl  [
	^ self location: aZnUrl asString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>cacheDirectory [
  "use class var to survive upgrade when MCGitHubRepository moved to subclass of MCGitBasedRepository"

  self resetCacheDirectoryIfInvalid.
  CacheDirectory ifNil: [ CacheDirectory := self defaultCacheDirectory ].
  ^ CacheDirectory
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>cacheDirectory: aDirectory [
  "use class var to survive upgrade when MCGitHubRepository moved to subclass of MCGitBasedRepository"

  CacheDirectory := aDirectory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>cacheDirectoryPath [
  <preference: 'GitHub Cache' category: 'Metacello' description: '' type:
    #'String'>
  ^ super cacheDirectoryPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>downloadCache [
  "use class var to survive upgrade when MCGitHubRepository moved to subclass of MCGitBasedRepository"

  DownloadCache ifNil: [ DownloadCache := Dictionary new ].
  ^ DownloadCache
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>eTagsCache [
  "To avoid GitHub rate limiting problems, we are caching the ETags for the tag request: https://developer.github.com/v3/#conditional-requests"

  ETagsCache ifNil: [ ETagsCache := Dictionary new ].
  ^ ETagsCache
]

{
	#category : #flushing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>flushDownloadCache [
    "self flushDownloadCache"

    DownloadCache := nil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>flushETagsCache [
  "mainly needed for tests .... but if you want to pare down object consumption..."

  "self flushETagsCache"

  ETagsCache := nil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>initialize [
	SessionManager default 
		registerNetworkClassNamed: self name.
	
	self flushDownloadCache.
	self resetCacheDirectoryIfInvalid.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>isEnabled [

	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>projectTagsUrlFor: projectPath [
  ^ 'https://api.github.com/repos/' , projectPath , '/tags'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>projectZipUrlFor: projectPath versionString: versionString [
  ^ 'https://github.com/' , projectPath , '/zipball/' , versionString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>resetCacheDirectoryIfInvalid [
  "use class var to survive upgrade when MCGitHubRepository moved to subclass of MCGitBasedRepository"

  "Reset if invalid"

  CacheDirectory notNil
    and: [ 
      (MCFileTreeFileUtils current directoryExists: CacheDirectory)
        ifFalse: [ CacheDirectory := nil ] ]
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>startUp: isImageStarting [
    "Flush the GitHub download cache"

    isImageStarting
        ifTrue: [ self flushDownloadCache ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository class>>urlSchemes [
	^ #(github)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository>>downloadJSONTags [
  | tagsUrl jsonObject |
  tagsUrl := self projectTagsUrlFor: self projectPath.
  jsonObject := MetacelloPlatform current
    downloadJSON: tagsUrl
    eTagsCache: self class eTagsCache
    eTagsKey: self projectPath
    username: self class siteUsername
    pass: self class sitePassword.
  ^ self normalizeTagsData: jsonObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitHubRepository>>normalizeTagsData: jsonObject [
  "return a dictionay mapping the tag name to the commit SHA"

  | tagDict |
  jsonObject isDictionary
    ifTrue: [ 
      jsonObject
        at: 'message'
        ifPresent: [ :errorString | 
          self
            error:
              'Error accessing tags for github project: ' , self projectPath printString
                , ' -> ' , errorString printString ] ].
  tagDict := Dictionary new.
  jsonObject
    do: [ :tagObject | 
      | tag commit |
      tag := tagObject at: 'name'.
      commit := tagObject at: 'commit'.
      tagDict at: tag put: (commit at: 'sha') ].
  ^ tagDict
]
