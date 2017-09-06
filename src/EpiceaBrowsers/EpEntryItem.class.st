"
I am a log browser item that represents an entry.
"
Class {
	#name : #EpEntryItem,
	#superclass : #Model,
	#instVars : [
		'browser',
		'entry',
		'triggerItems'
	],
	#category : #EpiceaBrowsers-UI-Log,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>= other [
	^ self species = other species and: [ self entry = other entry ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>asMorph [

	| morphs |
	morphs := OrderedCollection new.
	morphs addAll: self triggerMarkMorphs.
	morphs add: self icon asMorph.
	morphs addAll: self eventMorphs.
	morphs add: self morphFactory smallGap.
	morphs addAll: self timeMorphs.
	morphs addAll: self commentMorphs.

	^ self morphFactory rowWithAll: morphs
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>browseItem  [
	self eventAccept: EpBrowseVisitor new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>browser [
	^ browser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>browser: anObject [
	browser := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>commentMorphs [
	
	browser commentsLog
		commentAt: entry 
		ifPresent: [ :comment |
			comment trim ifNotEmpty: [:trimmedComment |
				^ { self morphFactory pillWith: trimmedComment } ] ].
	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>entry [
	^ entry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>entry: anObject [
	entry := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>event [

	^ entry content
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>eventAccept: aVisitor [

	^ entry content accept: aVisitor
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>eventMorphs [
	
	^ self eventAccept: EpMorphVisitor new
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>hash [
	^ self species hash bitXor: self entry hash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>icon [

	^ self eventAccept: EpIconVisitor new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>log [
	^ browser log
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>morphFactory [

	^ EpMorphFactory default
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>newStateString [

	^ self eventAccept: EpNewStateVisitor new
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>oldComment [

	^ browser commentsLog commentAt: entry ifAbsent: [ '' ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>oldStateString [

	^ entry content accept: EpOldStateVisitor new
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>printOn: aStream [
	super printOn: aStream.

	aStream nextPut: $(.
	self entry printOn: aStream.
	aStream nextPut: $).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>reference [
	^ self log referenceTo: entry
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>timeMorphs [
	
	^ self timeString
		ifEmpty: [ #() ]
		ifNotEmpty: [:aString | { self morphFactory secondaryStringFor: aString } ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>timeString [
	| aDateTime |
	aDateTime := self log timeAt: entry ifAbsent: [ ^ '' ].
	
	^ aDateTime epiceaBrowsersAsString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>triggerItems [
	^ triggerItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>triggerItems: anObject [
	triggerItems := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryItem>>triggerMarkMorphs [

	^ self triggerItems collect: [:item |
		self morphFactory semiTransparent: item icon ]
]
