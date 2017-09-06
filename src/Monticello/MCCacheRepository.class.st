"
I am a special monticello directory-based repository that is used for the global monticello cache.

Most other repositories will first query the default cache repository for existing files before handling the request by themselves. For instance an http repository will first check if the file is in the caceh before doing a ""slow"" download.
"
Class {
	#name : #MCCacheRepository,
	#superclass : #MCDirectoryRepository,
	#instVars : [
		'packageCaches',
		'seenFiles',
		'cacheEnabled'
	],
	#classInstVars : [
		'default'
	],
	#category : #Monticello-Repositories,
	#timestamp : '<historical>'
}

{
	#category : #'accessing settings',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>cacheDirectory [
	^self uniqueInstance directory asAbsolute
	
]

{
	#category : #'accessing settings',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>cacheDirectory: directory [
	"directory - can be an absolutePathString (to interface with the settings framework), or aFileReference"
 
	default := self new directory: directory asFileReference.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>default [
	"This should be deleted as soon as Metacello is fixed"
	self flag: #toBeDeleted.			
	^ self uniqueInstance 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>defaultDirectory [
	| directories |
	directories := {
		((FileLocator localDirectory / 'package-cache') asFileReference).	
		(FileLocator temp).	
		(FileLocator home)}.
	directories
		do: [ :directory | 
			[ ^ directory ensureCreateDirectory; yourself ]
				on: Error do: [ "ignore and try the next directory" ] ].
	Error signal: 'Can''t create a package-cache'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>description [
	^ nil
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>disableCacheDuring: aBlock [
	self uniqueInstance disableCacheDuring: aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>initialize [
	self resetIfInvalid
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>reset [

	default := nil.
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>resetIfInvalid [

	default notNil and: [default directory exists ifFalse: [default := nil]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository class>>uniqueInstance [
	self resetIfInvalid.
	^ default ifNil: [default := self new directory: self defaultDirectory]
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>basicStoreVersion: aVersion [
	"we store a version if it is cacheable and we don't have the file already"
	
	(aVersion isCacheable and: [(self includesFileNamed: aVersion fileName) not])
		ifTrue: [super basicStoreVersion: aVersion]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>cacheForPackage: aPackage [
	packageCaches ifNil: [packageCaches := Dictionary new].
	^ packageCaches at: aPackage ifAbsentPut: [MCPackageCache new]
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>disable [
	cacheEnabled := false.
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>disableCacheDuring: aBlock [
	self disable.
	aBlock ensure: [ self enable ].
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>enable [
	cacheEnabled := true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>initialize [
	cacheEnabled := true.
	super initialize.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>loadVersionFromFileNamed: aString [
	
	^ self versionReaderForFileNamed: aString do: [:r | r version]
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>newFileNames  [
	^ self allFileNames difference: self seenFileNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>rescan [
	self newFileNames do:
		[:ea |
		self versionReaderForFileNamed: ea do:
			[:reader |
			(self cacheForPackage: reader package)
				recordVersionInfo: reader info
				forFileNamed: ea.
			self seenFileNames add: ea]]
		displayingProgress: 'Scanning cache...'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>seenFileNames [
	^ seenFiles ifNil: [seenFiles := OrderedCollection new]
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>storeVersion: aVersion [
	cacheEnabled == true ifFalse: [ ^ self ].
	^ super storeVersion: aVersion.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>versionInfoForFileNamed: aString [
	^ self infoCache 
		at: aString 
		ifAbsentPut: [ self versionReaderForFileNamed: aString do: [:r | r info]]
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCCacheRepository>>versionWithInfo: aVersionInfo ifAbsent: errorBlock [
	(self allFileNamesForVersionNamed: aVersionInfo name) do: [:fileName | | version |
			version := self versionFromFileNamed: fileName.
			version info = aVersionInfo ifTrue: [^ version]].
	^ errorBlock value
]
