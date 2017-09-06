"
I am an abstract log of system events (EpEvent), stored into entries (OmEntry).
"
Class {
	#name : #EpAbstractLog,
	#superclass : #Object,
	#instVars : [
		'announcer'
	],
	#category : #Epicea-Log,
	#timestamp : 'MartinDias 3/13/2017 20:24'
}

{
	#category : #'tag keys',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog class>>authorKey [
	^ #author
]

{
	#category : #'tag keys',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog class>>priorReferenceKey [

	^ #prior
]

{
	#category : #'tag keys',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog class>>timeKey [
	^ #time
]

{
	#category : #'tag keys',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog class>>triggererReferenceKey [

	^ #trigger
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>announceAdded: anEntry [

	self announcer announce: (EpEntryAdded for: anEntry)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>authorAt: anEntry [

	^ self 
		authorAt: anEntry 
		ifAbsent: [ self error ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>authorAt: anEntry ifAbsent: aBlock [

	^ anEntry tags 
		at: self class authorKey
		ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>commentAt: anEntry ifAbsent: aBlock  [
	"Answer the String comment corresponding to anEntry, or evaluate aBlock if absent."

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>commentAt: anEntry ifPresent: aBlock  [
	"Answer the String comment corresponding to anEntry, and evaluate aBlock with it."

	| comment |
	comment := self commentAt: anEntry ifAbsent: [ ^self ].
	^ aBlock value: comment.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>entries [
	"Answer the entries of this log."

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>entriesCount [
	
	^ self entries size
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>entriesDo: aBlockClosure [
	"Evaluate aBlockClosure on every entry"
	
	^ self entries do: aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>entriesForAll: references [

	^ references collect: [ :each | self entryFor: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>entryFor: aReference [
	"Answer the entry corresponding to aReference"

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>entryFor: aReference ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [
	"Answer an entry, evaluating either the first block closure if present or the second if absent."
	
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>entryReferences [
	
	^ self referencesToAll: self entries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>events [

	^ self entries collect: #content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>firstEntryIfAbsent: absentBlock [
	"Answer the first entry of the log, or evaluate the absentBlock."

	^ self entries ifEmpty: absentBlock ifNotEmpty: [:collection | collection first ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>from: aReference detect: aBlockReturningBoolean [

	^ self
		from: aReference
		detect: aBlockReturningBoolean
		ifNotFound: [ :ref | KeyNotFound signalFor: aReference ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>from: aReference detect: aBlockReturningBoolean ifNotFound: notFoundBlock [

	self
		priorEntriesFrom: aReference
		do: [ :entry |
			(aBlockReturningBoolean value: entry)
				ifTrue: [ ^ entry ] ].
	^ notFoundBlock cull: aReference
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>fromHeadDetect: aBlockReturningBoolean [

	^ self
		from: self headReference
		detect: aBlockReturningBoolean
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>fromHeadDetect: aBlockReturningBoolean ifNotFound: notFoundBlock [

	^ self
		from: self headReference
		detect: aBlockReturningBoolean
		ifNotFound: notFoundBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>hasAuthor: anEntry [

	self 
		authorAt: anEntry 
		ifAbsent: [ ^ false ].
		
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>hasTime: anEntry [

	self 
		timeAt: anEntry 
		ifAbsent: [ ^ false ].
		
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>head [

	^ self entryFor: self headReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>headReference [
	"Answer a OmReference to the head of this log"

	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>isEmpty [

	self entriesDo: [ :each | ^false ].
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>nullReference [

	^ OmNullReference uniqueInstance
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>printOn: aStream [

	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		nextPutAll: self headReference asString;
		nextPut: $).
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>priorEntriesFrom: aReference [

	^ Array streamContents: [  :stream |
		self priorEntriesFrom: aReference do: [ :anEntry |
			stream nextPut: anEntry ] ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>priorEntriesFrom: aReference do: aBlock [

	| nextReference |
	nextReference := aReference.
	[ nextReference isNull ] whileFalse: [
		self 
			entryFor: nextReference 
			ifPresent: [ :entry | 
				aBlock value: entry.		
				nextReference := self priorReferenceAt: entry ]
			ifAbsent: [ ^ self ] ]

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>priorEntriesFrom: initialReference upTo: finalReference [

	| result |
	result := OrderedCollection new.
	
	self 
		priorEntriesFrom: initialReference 
		do: [ :anEntry |
			result add: anEntry.
			(self referenceTo: anEntry) = finalReference ifTrue: [ ^ result ].			
		].
	
	^ result
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>priorEntriesFromHead [

	^ self priorEntriesFrom: self headReference
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>priorEntriesFromHeadDo: aBlock [

	self priorEntriesFrom: self headReference do: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>priorReferenceAt: anEntry [

	^ anEntry tagAt: self class priorReferenceKey
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>referenceTo: anEntry [
	"Answer a OmReference corresponding to anEntry."

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>referencesToAll: aCollectionOfEntries [

	^ aCollectionOfEntries collect: [ :each | self referenceTo: each ]
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>refresh [
	"Do nothing by default"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>timeAt: anEntry [

	^ self 
		timeAt: anEntry 
		ifAbsent: [ self error ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>timeAt: anEntry ifAbsent: aBlock [

	^ anEntry tags 
		at: self class timeKey
		ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAbstractLog>>triggererReferenceOf: anEntry ifPresent: presentBlock ifAbsent: absentBlock [

	^ anEntry tags 
		at: self class triggererReferenceKey 
		ifPresent: presentBlock 
		ifAbsent: absentBlock
]
