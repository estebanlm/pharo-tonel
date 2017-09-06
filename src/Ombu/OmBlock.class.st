"
I represent a portion of a .ombu file. I'm a collaborator of OmBlockFileStore.
"
Class {
	#name : #OmBlock,
	#superclass : #Object,
	#instVars : [
		'firstEntryReference',
		'positions',
		'store',
		'startPosition',
		'endPosition'
	],
	#category : #Ombu-Stores,
	#timestamp : 'MartinDias 4/13/2017 20:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock class>>store: anOmBlockFileStore startPosition: aStartPosition endPosition: anEndPosition firstEntryReference: anOmReference [

	^ self basicNew
		initializeWithStore: anOmBlockFileStore
		startPosition: aStartPosition
		endPosition: anEndPosition
		firstEntryReference: anOmReference;
		yourself

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>atLocalName: aString ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [

	| index |
	self checkIfMustRefreshBlock.

	index := aString asInteger - self firstLocalNameAsInteger + 1.
	
	^ index > positions size
		ifTrue: absentBlockClosure
		ifFalse: [
			presentBlockClosure value: (positions at: index) ]
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>checkIfMustRefreshBlock [
	
	positions ifNil: [ self refresh ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>endPosition [
	^ endPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>firstEntryReference [
	^ firstEntryReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>firstLocalNameAsInteger [
	^ self firstEntryReference localName asInteger
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>initializeWithStore: anOmBlockFileStore startPosition: aStartPosition endPosition: anEndPosition firstEntryReference: anOmReference [

	self initialize.
	store := anOmBlockFileStore.
	startPosition := aStartPosition.
	endPosition := anEndPosition.
	firstEntryReference := anOmReference.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>lastLocalNameAsInteger [

	self checkIfMustRefreshBlock.
	
	^ positions size + self firstLocalNameAsInteger - 1.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>positions [
	^ positions
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>printOn: aStream [

	super printOn: aStream.
	
	aStream 
		nextPutAll: '(first entry: ';
		print: self firstLocalNameAsInteger;
		nextPutAll: ' positions: ';
		print: startPosition;
		nextPutAll: '..';
		print: endPosition;
		nextPut: $).

]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>refresh [
	"Read all OmEntry instances that belong to my range of file positions"
	
	positions := store entryPositionsStartingAt: startPosition upTo: endPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>refreshIfNeededStartingAt: firstStreamPosition since: initialLocalName  [

	positions isEmptyOrNil ifTrue: [ ^self ]. "Initial #refresh not yet done, so let things untouched."

	(self lastLocalNameAsInteger + 1) asString ~= initialLocalName ifTrue: [
		Halt now. "Shouldn't happen" ^self refresh ].

	"Then, it's only partially loaded i.e. outdated."
	positions addAll: (store entryPositionsStartingAt: firstStreamPosition upTo: endPosition).

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>startPosition [
	^ startPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmBlock>>store [
	^ store
]
