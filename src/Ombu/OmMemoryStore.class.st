"
I am an in-memory store of entries.
"
Class {
	#name : #OmMemoryStore,
	#superclass : #OmStore,
	#instVars : [
		'entries',
		'globalName'
	],
	#category : #Ombu-Stores,
	#timestamp : 'MartinDias 3/13/2017 16:33'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore class>>named: aGlobalName [

	^ self basicNew
		initializeWithGlobalName: aGlobalName;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore class>>new [

	^ self named: UUID new asString36
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore class>>withAll: aCollection [

	^ self new
		in: [:store | 
			aCollection 
				collect: [:each | OmEntry content: each ]
				thenDo: [:entry | store newEntry: entry ] ];
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>entries [
	^ entries
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>entriesDo: aBlockClosure  [
	entries do: aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>entryFor: aReference ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [

	| entry |
	(aReference isNull or: [ aReference globalName ~= self globalName])
		ifTrue: [ ^ absentBlockClosure value ].

	entry := entries
		at: aReference localName asInteger
		ifAbsent: [ ^ absentBlockClosure value ].
		
	^ presentBlockClosure cull: entry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>globalName [
	^ globalName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>headReference [
	"Answer a reference to the last entry added to this store, or OmNullReference uniqueInstance when empty."

	^ entries
		ifEmpty: [ OmNullReference uniqueInstance ]
		ifNotEmpty: [ self referenceTo: entries last ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>initializeWithGlobalName: aName [

	self initialize.
	globalName := aName.
	
	entries := OrderedCollection new.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>newEntry: anEntry [

	| localName newReference |
	localName := (entries size + 1) asString.
	newReference := self referenceToLocalName: localName.
	anEntry tags at: self selfReferenceKey put: newReference.
	entries add: anEntry.

]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>refresh [
	"Nothing to refresh"
	
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmMemoryStore>>writingFileReference [
	"Stub"
	
	^ (FileSystem memory / 'store.ombu') ensureCreateFile
]
