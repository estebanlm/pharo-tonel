"

"
Class {
	#name : #MCGitBasedNetworkRepository,
	#superclass : #MCFileTreeRepository,
	#instVars : [
		'projectPath',
		'projectVersion',
		'repoPath',
		'projectVersionPattern'
	],
	#classInstVars : [
		'repoCacheDirectory',
		'repoDownloadCache',
		'siteUsername',
		'sitePassword'
	],
	#category : #Metacello-GitBasedRepository,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>basicDescription [
  ^ self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>cacheDirectory [
  self resetCacheDirectoryIfInvalid.
  repoCacheDirectory ifNil: [ repoCacheDirectory := self defaultCacheDirectory ].
  ^ repoCacheDirectory
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>cacheDirectory: aDirectory [
  "explicitly set repoCacheDirectory"

  repoCacheDirectory := aDirectory
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>cacheDirectoryFor: projectPath [
	| cacheDirectory projectDirectory |
	
	cacheDirectory := self cacheDirectory.
	projectDirectory := MetacelloPlatform current directoryFromPath: projectPath relativeTo: cacheDirectory.
	MetacelloPlatform current ensureDirectoryExists: projectDirectory.
	^ projectDirectory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>cacheDirectoryPath [
  ^ MCFileTreeFileUtils current directoryPathString: self cacheDirectory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>cacheDirectoryPath: aString [
  self
    cacheDirectory:
      (aString
        ifEmpty: [  ]
        ifNotEmpty: [ MetacelloPlatform current fileHandleOn: aString ])
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>defaultCacheDirectory [
  | defaultDirectory cacheDirectory |
  defaultDirectory := MetacelloPlatform current defaultDirectory.
  cacheDirectory := MetacelloPlatform current
    directoryFromPath: self basicDescription , '-cache'
    relativeTo: defaultDirectory.
  MetacelloPlatform current ensureDirectoryExists: cacheDirectory.
  ^ cacheDirectory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>description [
  ^ self basicDescription , '://'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>downloadCache [
  repoDownloadCache ifNil: [ repoDownloadCache := Dictionary new ].
  ^ repoDownloadCache
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>downloadCacheKey: projectPath version: versionString [
  ^ projectPath , ':::' , versionString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>flushDownloadCache [
  "self flushDownloadCache"

  repoDownloadCache := nil
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>flushProjectEntry: projectPath version: versionString [
    self downloadCache removeKey: (self downloadCacheKey: projectPath version: versionString) ifAbsent: [  ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>initialize [
  "self initialize"

	SessionManager default 
		registerNetworkClassNamed: self name.

	self flushDownloadCache.
	self resetCacheDirectoryIfInvalid.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>isAbstract [
    "abstract as far as creating new repositories interactively? yes"

    ^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>isEnabled [

	^false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>location: locationUrl [
    ^ self location: locationUrl version: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>location: locationUrl version: versionString [
    ^ self parseLocation: locationUrl version: versionString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>parseLocation: locationUrl version: versionString [
  "self 
	parseLocation: 'github://dalehenrich/MetacelloRepository:master/monticello/repos/itory/path'
	version: nil
     "

  | projectPath projectVersion repoPath headerSize desc projectDelim repoDelim versionDelim |
  headerSize := self description size.
  desc := locationUrl.
  desc := desc copyFrom: headerSize + 1 to: desc size.
  projectVersion := repoPath := nil.
  projectDelim := desc indexOf: $/.
  repoDelim := desc indexOf: $/ startingAt: projectDelim + 1.
  (versionDelim := desc indexOf: $:) == 0
    ifTrue: [ 
      repoDelim == 0
        ifTrue: [ projectPath := desc ]
        ifFalse: [ 
          projectPath := desc copyFrom: 1 to: repoDelim - 1.
          repoPath := desc copyFrom: repoDelim + 1 to: desc size ] ]
    ifFalse: [ 
      projectPath := desc copyFrom: 1 to: versionDelim - 1.
      repoDelim == 0
        ifTrue: [ projectVersion := desc copyFrom: versionDelim + 1 to: desc size ]
        ifFalse: [ 
          projectPath := desc copyFrom: 1 to: versionDelim - 1.
          self
            parseProjectVersionField: [ :pv :rp | 
              projectVersion := pv.
              repoPath := rp ]
            desc: desc
            versionDelim: versionDelim ] ].
  versionString ~~ nil
    ifTrue: [ projectVersion := versionString ].
  ^ self new
    projectPath: projectPath
    projectVersion: projectVersion
    repoPath: repoPath
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>parseProjectVersionField: parseBlock desc: desc versionDelim: versionDelim [
  "Issue #234: have to allow for commitish containing slashes"

  | strm done escaped repoDelim |
  strm := WriteStream on: String new.
  repoDelim := versionDelim + 1.
  escaped := done := false.
  [ done ]
    whileFalse: [ 
      | char |
      repoDelim > desc size
        ifTrue: [ done := true ]
        ifFalse: [ 
          char := desc at: repoDelim.
          char == $\
            ifTrue: [ 
              escaped
                ifTrue: [ 
                  "$\ not legal in branch name ... literally ignored"
                  escaped := false ]
                ifFalse: [ escaped := true ] ]
            ifFalse: [ 
              char == $/
                ifTrue: [ 
                  escaped
                    ifFalse: [ done := true ] ].
              done
                ifFalse: [ strm nextPut: char ].
              escaped := false ].
          repoDelim := repoDelim + 1 ] ].
  repoDelim := repoDelim - 1.
  parseBlock
    value: strm contents
    value: (desc copyFrom: repoDelim + 1 to: desc size)
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>projectDirectoryFrom: projectPath version: versionString [
  | mcPlatform theCacheDirectory projectDirectory downloadCacheKey cachePath pid |
  downloadCacheKey := self downloadCacheKey: projectPath version: versionString.
  mcPlatform := MetacelloPlatform current.
  theCacheDirectory := mcPlatform
    directoryFromPath: versionString
    relativeTo: (self cacheDirectoryFor: projectPath).
  cachePath := self downloadCache at: downloadCacheKey ifAbsent: [  ].
  (cachePath isNil
    or: [ 
      (projectDirectory := mcPlatform
        directoryFromPath: cachePath
        relativeTo: theCacheDirectory) exists not ])
    ifTrue: [ 
      | url archive directory zipFileName |
      MetacelloScriptGitBasedDownloadNotification new
        projectPath: projectPath;
        versionString: versionString;
        signal.	"for testing purposes"
      mcPlatform ensureDirectoryExists: theCacheDirectory.
      url := self projectZipUrlFor: projectPath versionString: versionString.
      pid := MetacelloPlatform current processPID.
      zipFileName := MetacelloPlatform current
        tempFileFor:
          self basicDescription , '-' , pid , '-'
            , (downloadCacheKey select: [ :c | c isAlphaNumeric ])
        suffix: '.zip'.
      archive := MetacelloPlatform current
        downloadZipArchive: url
        to: zipFileName.
      directory := mcPlatform
        directoryFromPath: (cachePath := archive members first fileName)
        relativeTo: theCacheDirectory.
      directory exists
        ifFalse: [ 
          MetacelloPlatform current
            extractRepositoryFrom: zipFileName
            to: theCacheDirectory fullName ].
      self downloadCache at: downloadCacheKey put: cachePath.
      projectDirectory := mcPlatform
        directoryFromPath: cachePath
        relativeTo: theCacheDirectory ].
  ^ projectDirectory

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>projectTagsUrlFor: aProjectPath [
  self subclassResponsibility
]

{
	#category : #'version patterns',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>projectVersionFromString: aString [
  "strip leading $v if present and return an instance of MetacelloVersionNumber"

  | versionString |
  versionString := aString.
  (versionString beginsWith: 'v')
    ifTrue: [ versionString := versionString copyFrom: 2 to: versionString size ].
  ^ MetacelloVersionNumber fromString: versionString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>projectZipUrlFor: projectPath versionString: versionString [
  self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>resetCacheDirectoryIfInvalid [
  "Reset if invalid"

  repoCacheDirectory notNil
    and: [ 
      (MCFileTreeFileUtils current directoryExists: repoCacheDirectory)
        ifFalse: [ repoCacheDirectory := nil ] ]
]

{
	#category : #'site credentials',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>sitePassword [
  ^ sitePassword
]

{
	#category : #'site credentials',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>sitePassword: aString [
  sitePassword := aString
]

{
	#category : #'site credentials',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>siteUsername [
  ^ siteUsername
]

{
	#category : #'site credentials',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>siteUsername: aString [
  siteUsername := aString
]

{
	#category : #'site credentials',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>siteUsername: username sitePassword: pass [
  "MCBitbucketRepository siteUsername: '' sitePassword: ''"

  "MCGitHubRepository siteUsername: '' sitePassword: ''"

  self
    siteUsername: username;
    sitePassword: pass
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository class>>startUp: resuming [
    "Flush the GitHub download cache"

    resuming
        ifTrue: [ self flushDownloadCache ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>asRepositorySpecFor: aMetacelloMCProject [
  ^ aMetacelloMCProject repositorySpec
		description: self description;
		type: self class basicDescription;
		yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>canUpgradeTo: anMCGitBasedRepository [
  (anMCGitBasedRepository isKindOf: self class)
    ifFalse: [ ^ false ].
  ^ self projectPath = anMCGitBasedRepository projectPath
    and: [ self repoPath = anMCGitBasedRepository repoPath ]
]

{
	#category : #descriptions,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>description [
  | desc |
  desc := self class description , self projectPath , ':'
    , self projectVersionEscaped.
  self repoPath isEmpty
    ifTrue: [ ^ desc ].
  ^ desc , '/' , self repoPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>directory [
  directory
    ifNil: [ 
      directory := self class
        projectDirectoryFrom: self projectPath
        version: self projectVersion.
      self repoPath isEmpty
        ifFalse: [ 
          directory := MetacelloPlatform current
            directoryFromPath: self repoPath
            relativeTo: directory ] ]
    ifNotNil: [ 
      (MCFileTreeFileUtils current directoryExists: directory)
        ifFalse: [ 
          self flushCache.
          ^ self directory ] ].
  ^ directory
]

{
	#category : #descriptions,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>directoryDescription [
    ^ self directory pathName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>downloadJSONTags [
  | tagsUrl jsonObject |
  tagsUrl := self projectTagsUrlFor: self projectPath.
  jsonObject := MetacelloPlatform current
    downloadJSON: tagsUrl
    username: self class siteUsername
    pass: self class sitePassword.
  ^ self normalizeTagsData: jsonObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>flushCache [
  "the directory acts like a cache since we download the directory from a git-based repository (github, bitbucket, etc.)"

  [ super flushCache ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show:
            'Error for: ' , self description printString , ' during flushCache: '
                , ex description printString ].
  self class flushDownloadCache.
  directory := nil
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>flushForScriptGet [
    self class flushProjectEntry: self projectPath version: self projectVersion.
    directory := nil
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>hasNoLoadConflicts: anMCGitBasedRepository [
  (anMCGitBasedRepository isKindOf: self class)
    ifFalse: [ ^ false ].
  ^ self projectPath = anMCGitBasedRepository projectPath
    and: [ 
      self repoPath = anMCGitBasedRepository repoPath
        and: [ self projectVersion = anMCGitBasedRepository projectVersion ] ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>hash [
    ^ self description hash
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>initialize [
    super initialize.
    directory := nil.	"we'll lazily create the directory instance"
    self readonly: true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>isValid [
    ^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>metacelloProjectClassFor: aScriptEngine [
    ^ MetacelloMCBaselineProject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>normalizeTagsData: jsonObject [
  ^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectPath [
    ^ projectPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectPath: anObject [
    projectPath := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectPath: aProjectPath projectVersion: aProjectVersion repoPath: aRepoPath [
  self projectPath: aProjectPath.
  self projectVersion: aProjectVersion.	"Important that projectVersion be set AFTER projectPath"
  self repoPath: aRepoPath
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectTagsUrlFor: aProjectPath [
  ^ self class projectTagsUrlFor: aProjectPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectVersion [
    (projectVersion == nil or: [ projectVersion isEmpty ])
        ifTrue: [ projectVersion := 'master' ].
    ^ projectVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectVersion: aString [
  "Important that projectVersion be set AFTER projectPath, as projectPath needed for resolving projectVersionPattern"

  | x |
  aString
    ifNil: [ 
      projectVersion := aString.
      ^ self ].
  (x := aString
    findDelimiters:
      {$#.
      $*.
      $?}
    startingAt: 1) <= aString size
    ifTrue: [ self resolveProjectVersionPattern: aString ]
    ifFalse: [ projectVersion := aString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectVersionEscaped [
  | pv |
  pv := self projectVersion.
  (projectVersion includes: $/)
    ifTrue: [ ^ pv copyReplaceAll: '/' with: '\/' ].
  ^ pv
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectVersionPattern [
  "do not set projectVersionPattern unless it _is_ a pattern: includes $#, %*, or $?"

  projectVersionPattern ifNil: [ ^ self projectVersion ].
  ^ projectVersionPattern
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>projectVersionPattern: aString [
  "do not set projectVersionPattern unless it _is_ a pattern: includes $#, %*, or $?"

  projectVersionPattern := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>repoPath [
  repoPath ifNil: [ repoPath := '' ].
  ^ repoPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>repoPath: anObject [
    repoPath := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>repositoryBranchName [
  "for git-based network repos, answer the value of the projectVersion field"

  ^ self projectVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>repositoryVersionString [
  "for git-based network repos, answer the SHA associated with the download: a commit SHA or tag SHA"

  | versionComponents versionElement pathElements gitBasedPath repositoryDirPath projectDirPath projectDir projectVersionDir |
  repositoryDirPath := self directory fullName.
  projectDir := self class cacheDirectoryFor: self projectPath.
  projectVersionDir := MCFileTreeFileUtils current
    directoryFromPath: self projectVersion
    relativeTo: projectDir.
  projectDirPath := projectVersionDir fullName.
  (repositoryDirPath beginsWith: projectDirPath)
    ifFalse: [ ^ self projectVersion ].
  gitBasedPath := repositoryDirPath
    copyFrom: projectDirPath size + 2
    to: repositoryDirPath size.
  pathElements := gitBasedPath findTokens: '/'.
  versionElement := pathElements at: 1.
  versionComponents := versionElement findTokens: '-'.
  ^ versionComponents last
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGitBasedNetworkRepository>>resolveProjectVersionPattern: aString [
  "aString must conform to the syntax for MetacelloVersionNumber with the exception that aString may have a leading $v which is stripped before conversion to a MetacelloVersionNumber patterm"

  | patternString tagDictionary matchingTags tagAssocs sortedMatchingTags theTag |
  self projectPath
    ifNil: [ self error: 'projectPath must be set to resolve project version pattern.' ].
  patternString := (self class projectVersionFromString: aString) asString.
  tagDictionary := self downloadJSONTags.
  tagAssocs := tagDictionary keys
    collect: [ :tagName | 
      | tagVersion |
      tagVersion := self class projectVersionFromString: tagName.
      tagVersion -> tagName ].
  matchingTags := tagAssocs select: [ :assoc | assoc key match: patternString ].
  matchingTags isEmpty
    ifTrue: [ 
      projectVersion := aString.
      ^ self
        error:
          'No tags matching the pattern ' , aString printString
            , ' found for repository description '
            , self description printString ].
  sortedMatchingTags := matchingTags asArray sort: [ :a :b | a key <= b key ].
  theTag := sortedMatchingTags last.
  projectVersionPattern := aString.
  projectVersion := theTag value
]
