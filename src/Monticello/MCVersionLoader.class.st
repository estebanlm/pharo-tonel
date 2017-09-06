"
A MCVersionLoader is responsible for loading a given version. 
"
Class {
	#name : #MCVersionLoader,
	#superclass : #Object,
	#instVars : [
		'versions'
	],
	#category : #Monticello-Loading,
	#timestamp : '<historical>'
}

{
	#category : #'public api',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader class>>loadVersion: aVersion [
	self new
		addVersion: aVersion;
		load
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>addDependency: aDependency [
	| dep |
	aDependency isCurrent ifTrue: [^ self].
	(self depAgeIsOk: aDependency) ifFalse: [^ self].
	dep := aDependency resolve.
	dep
		ifNil: [self confirmMissingDependency: aDependency]
		ifNotNil: [(versions includes: dep) ifFalse: [self addVersion: dep]]
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>addVersion: aVersion [
	aVersion dependencies do: [ :ea | self addDependency: ea].
	versions add: aVersion.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>announceLoad: aString do: aBlock [
	| returnValue |
	returnValue := nil.
	[ self announceLoadStart: aString ] ensure: [ 
		[ returnValue := aBlock value ] ensure: [ 
			self announceLoadStop: aString ] ].
	^ returnValue
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>announceLoadStart: aString [
	SystemAnnouncer uniqueInstance announce: (MCVersionLoaderStarted new
		versionLoader: self;
		label: aString; 
		yourself)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>announceLoadStop: aString [
	SystemAnnouncer uniqueInstance announce: (MCVersionLoaderStopped new
		versionLoader: self;
		label: aString; 
		yourself)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>basicLoadWithNameLike: aString [
	| loader |
	
	self checkForModificationsIfCancel: [ ^ self] ifMerge: [ ^ self mergeVersions ].
	
	loader := versions size > 1
		ifTrue: [MCMultiPackageLoader new]
		ifFalse: [MCPackageLoader new].
		
	versions do: [:ea |
		ea canOptimizeLoading
			ifTrue: [ea patch applyTo: loader]
			ifFalse: [loader updatePackage: ea package withSnapshot: ea snapshot]].
		
	loader loadWithNameLike: aString.
	versions do: [:ea | ea workingCopy loaded: ea]
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>checkForModificationsIfCancel: cancelBlock ifMerge: mergeBlock [
	| modifications |
	
	"first check if there are local packages which are dirty"
	modifications := self localModifications.
	modifications isEmpty ifTrue: [ ^ self].
	
	"ask the user what to do.. merge | overwrite | abort"
	^ self warnAboutLosingChangesTo: modifications ifCancel: cancelBlock ifMerge: mergeBlock
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>checkIfDepIsOlder: aDependency [
	^ aDependency isOlder not 
		or: [self confirm: 'load older dependency ', aDependency versionInfo name , '?']
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>confirmMissingDependency: aDependency [
	| name |
	name := aDependency versionInfo name.
	(self confirm: 'Can''t find dependency ', name, '. ignore?')
		ifFalse: [self error: 'Can''t find dependency ', name]
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>depAgeIsOk: aDependency [
	^ aDependency isOlder not 
		or: [self confirm: 'load older dependency ', aDependency versionInfo name , '?']
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>ensurePackage: mcPackage  [
	RPackageOrganizer default registerPackageNamed: mcPackage name 
		
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>hasLocalModifications [
	^ self localModifications isEmpty not
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>hasVersions [

	^ versions isEmpty not
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>initialize [
	super initialize.
	versions := OrderedCollection new
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>load [
	RPackageSet withCacheDo: [   
		| version |
		version := versions first. 
		[ self ensurePackage: version package.
		  self loadWithNameLike: version info name ] asJob
				title: 'Loading ', version info name asString;
				run ]
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>loadWithNameLike: aString [
	" this is THE central entrypoint for all loading (gopher, metacello, monticello, ...) "
	^ self announceLoad: aString do: [ self basicLoadWithNameLike: aString ]
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>localModifications [
	^ versions select: [:ea | ea package workingCopy modified].
	
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>mergeVersions [
	|merger|
	merger :=  MCVersionMerger new.
	merger addVersions: self localModifications.
	merger merge.
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>warnAboutLosingChangesTo: versionCollection [
	^ (MCMergeOrLoadWarning signalFor: versionCollection).
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoader>>warnAboutLosingChangesTo: versionCollection ifCancel: cancelBlock ifMerge: mergeBlock [
	
	| result |

	result := (MCMergeOrLoadWarning signalFor: versionCollection).
	
	result = false ifTrue: [ ^ mergeBlock value ].
	result = nil ifTrue: [ ^ cancelBlock value ].
	
	"otherwise we will continue loading"
]
