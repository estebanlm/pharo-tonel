"
I'm a log whose entries can have an arbitrary order and origin.
"
Class {
	#name : #EpSorterLog,
	#superclass : #EpAbstractLog,
	#instVars : [
		'entries'
	],
	#category : #Epicea-Log,
	#timestamp : 'MartinDias 3/13/2017 23:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSorterLog>>commentAt: anEntry ifAbsent: aBlock [
	"Stub"

	^ aBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSorterLog>>entries [
	^ entries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSorterLog>>entries: anObject [
	entries := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSorterLog>>entryFor: aReference [
	"Answer the entry corresponding to aReference"

	^ self
		entryFor: aReference
		ifPresent: [ :anEntry | ^ anEntry ] 
		ifAbsent: [ NotFound signalFor: aReference ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSorterLog>>entryFor: aReference ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [
	"Answer an entry, evaluating either the first block closure if present or the second if absent."

	self entriesDo: [:each | 
		(self referenceTo: each) = aReference 
			ifTrue: [ ^ presentBlockClosure cull: each ] ].
	
	^ absentBlockClosure value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSorterLog>>headReference [
	"Answer a OmReference to the head of this log"

	self flag: #todo. "Maybe this is a concept that only belongs to EpLog... remove from superclass?"
	self shouldBeImplemented
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpSorterLog>>referenceTo: anEntry [
	"Answer a OmReference corresponding to anEntry."

	^ anEntry tags at: OmStore selfReferenceKey
]
