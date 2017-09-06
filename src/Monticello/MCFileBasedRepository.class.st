"
A file based metacello repository
"
Class {
	#name : #MCFileBasedRepository,
	#superclass : #MCRepository,
	#instVars : [
		'cache',
		'allFileNames',
		'cacheFileNames'
	],
	#category : #Monticello-Repositories,
	#timestamp : 'TorstenBergmann 2/5/2014 13:55'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository class>>basicFromUrl: aZnUrl  [
	^ MCDirectoryRepository new directory: aZnUrl asFileReference
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository class>>cleanUp [
	"Flush caches"

	self flushAllCaches.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository class>>flushAllCaches [
	self allSubInstancesDo: [:ea | ea flushCache]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository class>>monticelloSettingsOn: aBuilder   [
	<systemsettings>  
	(aBuilder group: #monticello)
		label: 'Monticello';
		parent: #SCM;
		description: 'All Monticello settings';
		with: [ 
			(aBuilder setting: #defaultDirectoryName)
				type: #Directory;
				target: MCDirectoryRepository;
				description: 'The path of a directory where you want to start out when choosing local repository locations' ;
				label: 'Default local repository directory'.
			(aBuilder setting: #cacheDirectory)
				type: #Directory;
				target: MCCacheRepository;
				description: 'The path of the local repository cache';
				label: 'Local cache directory'.	
				
				].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository class>>urlSchemes [
	^ #(file)
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>addVersionInformationExtractedFrom: readableFileName to: versions [
	| name |
	name := (readableFileName copyUpToLast: $.) copyUpTo: $(.
	name last isDigit
		ifTrue: [ 
			versions
				add:
					{(name copyUpToLast: $-).	"pkg name"
					((name copyAfterLast: $-) copyUpTo: $.).	"user"
					(((name copyAfterLast: $-) copyAfter: $.) asInteger ifNil: [ 0 ]).	"version"
					readableFileName }]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>allFileNames [
	cacheFileNames == true ifFalse: [ ^ self loadAllFileNames ].
	^ allFileNames ifNil: [
			allFileNames := self loadAllFileNames]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>allFileNamesForVersionNamed: aString [
	^ self filterFileNames: self readableFileNames forVersionNamed: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>allFileNamesOrCache [
	cacheFileNames == true ifFalse: [ ^ self allFileNames ].
	^ allFileNames ifNil: [
			allFileNames := self allFileNames]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>allVersionNames [
	^ self readableFileNames collect: [:ea | self versionNameFromFileName: ea]
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>basicStoreVersion: aVersion [
	self
		writeStreamForFileNamed: aVersion fileName
		do: [:s | aVersion fileOutOn: s].
	aVersion isCacheable ifTrue: [
		cache ifNil: [cache := Dictionary new].
		cache at: aVersion fileName put: aVersion].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>cache [
	^ cache ifNil: [cache := Dictionary new]
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>cacheAllFileNamesDuring: aBlock [
	cacheFileNames == true ifTrue: [ ^ aBlock value ].
	allFileNames := nil.
	cacheFileNames := true.	
	^ aBlock ensure: [
		allFileNames := nil.
		cacheFileNames := false]
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>cachedFileNames [
	^cache == nil
		ifTrue: [#()]
		ifFalse: [cache keys]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>canReadFileNamed: aString [
	| reader |
	reader := MCVersionReader readerClassForFileNamed: aString.
	^ reader notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>closestAncestorVersionFor: anAncestry ifNone: errorBlock [
	^ self
		cacheAllFileNamesDuring: [ 
			anAncestry breadthFirstAncestorsDo: [ :ancestorInfo | (self notCachedVersionWithInfo: ancestorInfo) ifNotNil: [ :v | ^ v ] ].
			^ errorBlock value ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>filterFileNames: aCollection forVersionNamed: aString [
	^ aCollection select: [:ea | (self versionNameFromFileName: ea) = aString] 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>flushCache [
	cache := nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>includesFileNamed: aString [
	"slow default implementation"
	^ self allFileNames includes: aString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>includesVersionNamed: aString [
	^ self allVersionNames includes: aString
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>loadAllFileNames [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>loadNotCachedVersionFromFileNamed: aString [
	
	^ self versionReaderForFileNamed: aString do: [:r | r version]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>loadVersionFromFileNamed: aString [

	(MCCacheRepository uniqueInstance includesFileNamed: aString)
		ifTrue: [ ^ MCCacheRepository uniqueInstance loadVersionFromFileNamed: aString].
	
	^ self versionReaderForFileNamed: aString do: [:r | r version]
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>loadVersionInfoFromFileNamed: aString [
	^ self versionReaderForFileNamed: aString do: [:r | r info]
	
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>maxCacheSize [
	^ 512
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>notCachedVersionWithInfo: aVersionInfo  [
	(self allFileNamesForVersionNamed: aVersionInfo name)
		do: [ :fileName | 
			| version |
			version := self versionFromRepositoryFromFileNamed: fileName.
			version info = aVersionInfo
				ifTrue: [ ^ version ] ].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>possiblyNewerVersionsOfAnyOf: someVersions [
	| pkgs |
	pkgs := Dictionary new.

	someVersions do: [:aVersionInfo |
		pkgs at: (aVersionInfo name copyUpToLast: $-)
			put: (aVersionInfo name copyAfterLast: $.) asNumber].

	^[self allVersionNames select: [:each |
		(pkgs at: (each copyUpToLast: $-) ifPresent: [:verNumber |
			verNumber < (each copyAfterLast: $.) asNumber
				or: [verNumber = (each copyAfterLast: $.) asNumber
					and: [someVersions noneSatisfy: [:v | v name = each]]]]) == true]
	] on: Error do: [:ex | ex return: #()]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>readableFileNames [
	| all cached new emptyFilenamelength |
	"<hyphenated-package-name>.<dotted.branch.tag>-<initials>.<count>.mcz"
	emptyFilenamelength := 'P-i.c.mcz' size.
	all := self allFileNames.	"from repository"
		
	all := all reject: [ :each |  each size < emptyFilenamelength].
		"first stupid way to filter first level broken files. Ideally we should 
		remove any files not following the naming pattern: PackageName-author.number[(branch)].mcz"
	
	"Another stupid way to remove filename when using filetree repositories."
	all := all reject: [ :each | each beginsWith: '.filetree' ].
	
	cached := self cachedFileNames.	"in memory"
	new := all difference: cached.
	^ (cached asArray, new)
		select: [:ea | self canReadFileNamed: ea]
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>resizeCache: aDictionary [
	[aDictionary size <= self maxCacheSize] whileFalse:
		[aDictionary removeKey: aDictionary keys atRandom]
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>storeVersion: aVersion [

	(self includesFileNamed: aVersion fileName) ifTrue: [ ^ self ].
	^ super storeVersion: aVersion.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>updateCachedVersionFromFileName: aString with: aVersion [
	self resizeCache: cache.
	(aVersion notNil and: [aVersion isCacheable]) ifTrue: [cache at: aString put: aVersion].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>versionFrom: aVersionReferenceString [
	^ self loadVersionFromFileNamed: aVersionReferenceString , '.mcz'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>versionFromFileNamed: aFileName [
	| version |
	version := self cache
			 at: aFileName 
			 ifAbsent: [ self loadVersionFromFileNamed: aFileName ].
	self updateCachedVersionFromFileName: aFileName with: version.
	^ version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>versionFromRepositoryFromFileNamed: aFileName [
	| version |
	version := self cache
			 at: aFileName 
			 ifAbsent: [ self loadNotCachedVersionFromFileNamed: aFileName ].
	self updateCachedVersionFromFileName: aFileName with: version.
	^ version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>versionInfoFromFileNamed: aFileName [
	self cache 
		at: aFileName
		ifPresent: [:version | ^ version info].
	^ self loadVersionInfoFromFileNamed: aFileName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>versionNameFromFileName: aFileName [
	^ (aFileName copyUpToLast: $.) copyUpTo: $(
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>versionReaderForFileNamed: aString do: aBlock [
	^ self
		readStreamForFileNamed: aString
		do: [:s |
			(MCVersionReader readerClassForFileNamed: aString) ifNotNil:
				[:class | aBlock value: (class on: s fileName: aString)]]

]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>versionWithInfo: aVersionInfo ifAbsent: errorBlock [
	"get a version for the given versionInfo. always query first the packageCache and only then try to load the version from the remote location"
	^ MCCacheRepository uniqueInstance
		versionWithInfo: aVersionInfo 
		ifAbsent: [
			(self allFileNamesForVersionNamed: aVersionInfo name) do:
				[:fileName | | version |
				version := self versionFromRepositoryFromFileNamed: fileName.
				version info = aVersionInfo ifTrue: [^ version]].
			^ errorBlock value].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>versionsWithPackageNames [
	| versions |
	versions := OrderedCollection new.
	self readableFileNames
		do: [ :each | 
		      self addVersionInformationExtractedFrom: each to: versions ].
	^ versions
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFileBasedRepository>>writeStreamForFileNamed: aString do: aBlock [
	^ self writeStreamForFileNamed: aString replace: false do: aBlock
]
