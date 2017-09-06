"
I wrap a file store that is renewed each time either the Smalltalk session changes, among others (check #needsReset).
"
Class {
	#name : #OmSessionStore,
	#superclass : #OmStore,
	#instVars : [
		'currentSession',
		'currentImagePathString',
		'currentStore',
		'alternativeStore',
		'baseLocator',
		'announcer',
		'writingDeferDuration',
		'headReference',
		'storeNameStrategy'
	],
	#classInstVars : [
		'storeNameStrategy',
		'defaultBaseLocator'
	],
	#category : #Ombu-Stores,
	#timestamp : 'MartinDias 4/16/2014 14:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore class>>defaultBaseLocator [

	^ defaultBaseLocator ifNil: [ 
		defaultBaseLocator := FileLocator localDirectory / 'ombu-sessions' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore class>>defaultBaseLocator: aFileLocator  [

	defaultBaseLocator := aFileLocator
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore class>>initialize [
	"
	self initialize
	"
	SessionManager default registerUserClassNamed: self name

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore class>>new [

	^ self newWithBaseLocator: self defaultBaseLocator
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore class>>newWithBaseLocator: aBaseDirectory [

	^ self basicNew
		initializeWithBaseLocator: aBaseDirectory
		yourself
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore class>>startUp [
	"The #store accessor refreshes each instance since it will discover that the Session changed"

	self allInstancesDo: #store 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore class>>storeNameStrategy [

	^ storeNameStrategy ifNil: [ 
		storeNameStrategy := OmRandomSuffixStrategy new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore class>>storeNameStrategy: aStoreNameStrategy [

	storeNameStrategy := aStoreNameStrategy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>announcer [

	^ announcer ifNil: [ 
		announcer := Announcer new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>baseLocator [

	^ baseLocator
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>directory [

	^ baseLocator asFileReference
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>entriesDo: aBlockClosure [
	"Evaluate aBlockClosure with every entries this store contains"

	^ self store entriesDo: aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>entryFor: aReference ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [
	"Look for an entry, evaluating either the first block closure if present or the second if absent."

	^ self store 
		entryFor: aReference 
		ifPresent: presentBlockClosure 
		ifAbsent: absentBlockClosure
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>existsStoreNamed: aName [

	^ OmFileStore existsStoreNamed: aName inDirectory: self directory

]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>flush [
	"Flush any buffered state"
	
	self store flush
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>globalName [

	^ self store globalName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>headReference [
	"Answer a reference to the last entry added to this store."

	^ headReference ifNil: [
		headReference := self store headReference ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>imagePathString [
	"Answer the full path name for the current image."

	^ SmalltalkImage current primImagePath
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>initializeWithBaseLocator: aDirectoryFileLocator [

	self initialize.
	
	baseLocator := aDirectoryFileLocator.
	self store. "Force initialization"
	headReference := self store headReference.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>lowLevelFileStoreIfNone: aBlock [
	"Needed by EpLostChangesDetector"
	
	^ currentStore ifNil: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>needsReset [

	^ currentSession ~~ Smalltalk session
		or: [ currentImagePathString ~= self imagePathString ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>newEntry: anEntry [
	"Persist a new entry"

	self store newEntry: anEntry.
	headReference := self store headReference.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>nextStoreName [

	| name |
	name := currentStore 
		ifNil: [ "First store name"
			Smalltalk imageFile basenameWithoutExtension, '.1' ]
		ifNotNil: [ "There is already a name"
			currentStore globalName ].
		
	^ self storeNameStrategy nextTo: name in: self directory

]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>refresh [

	^ self store refresh
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>resetWithNextStoreName [

	self resetWithStoreNamed: self nextStoreName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>resetWithStoreNamed: newName [

	| fileReference |
	"First, ensure file is not already used."
	fileReference := OmFileStore 
		fileReferenceForStoreNamed: newName
		inDirectory: self directory.
	fileReference exists ifTrue: [
		FileExists signalWith: fileReference ].
	
	"Then, we can proceed."
	currentSession := Smalltalk session.
	currentImagePathString := self imagePathString.
	currentStore := 
		OmStoreFactory current
			named: newName
			inDirectory: self directory ensureCreateDirectory.
	currentStore writingDeferDuration: self writingDeferDuration.
	
	"Announce"
	self announcer announce: OmSessionStoreUpdated new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>store [
	"Answer the store I wrap"

	(currentStore isNil or: [ self needsReset ]) 
		ifTrue: [ self resetWithNextStoreName ].
	
	^ currentStore
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>storeNameStrategy [

	^ storeNameStrategy ifNil: [ self class storeNameStrategy ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>storeNameStrategy: anOmStoreNameStrategy [

	storeNameStrategy := anOmStoreNameStrategy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>writingDeferDuration [

	^ writingDeferDuration ifNil: [ OmFileStore defaultWritingDeferDuration ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>writingDeferDuration: aDuration [

	writingDeferDuration := aDuration.
	self store writingDeferDuration: aDuration.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStore>>writingFileReference [

	^ currentStore writingFileReference
]
