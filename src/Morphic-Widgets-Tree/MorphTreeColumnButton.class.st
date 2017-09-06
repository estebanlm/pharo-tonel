"
A button in a morphic based tree
"
Class {
	#name : #MorphTreeColumnButton,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'model',
		'icon'
	],
	#category : #Morphic-Widgets-Tree,
	#timestamp : 'TorstenBergmann 9/5/2014 15:26'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>acceptDroppingMorph: aMorph event: evt [
	self model container swapColumn: self model withColumn: aMorph passenger.
	evt hand releaseMouseFocus: self.
	self noMorePotentialDropTarget.
	self model container changed.
	Cursor normal show.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>asPotentialDropTarget  [
	self model asPotentialDropTarget
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>handlesMouseOverDragging: evt [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>icon [

	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>icon: anIcon [
	
	icon ifNotNil: [ self removeMorph: icon ].
	
	anIcon ifNotNil: [
		icon := anIcon.
		self addMorphFront: anIcon ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>initialize [
	super initialize.
	self enableDragNDrop: true.
	self fillStyle: (self theme morphTreeColumnFillStyleFor: self).
	self borderStyle: (self theme morphTreeColumnBorderStyleFor: self)

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>isDefault [
	^true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>model [
	^ model
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>model: anObject [
	model := anObject
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>mouseDown: anEvent [
	| selectors |
	selectors := Array 
		with: #click:
		with: nil
		with: nil
		with: (self dragEnabled ifTrue:[#startDrag:] ifFalse:[nil]).
	anEvent hand waitForClicksOrDrag: self event: anEvent selectors: selectors threshold: 10.
	super mouseDown: anEvent
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>mouseEnterDragging: evt [
	(evt hand hasSubmorphs and:[self dropEnabled]) ifFalse: ["no d&d"
		^ super mouseEnterDragging: evt].
	(self wantsDroppedMorph: evt hand firstSubmorph event: evt )
		ifTrue:[
			self asPotentialDropTarget.
		].
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>mouseLeaveDragging: evt [
	self noMorePotentialDropTarget 
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>mouseUp: evt [
	self noMorePotentialDropTarget.
	super mouseUp: evt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>noMorePotentialDropTarget [
	self model noMorePotentialDropTarget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>removeIcon [
	
	icon ifNotNil: [ self removeMorph: icon ].
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>startDrag: anEvent [
	| aTransferMorph |
	self dragEnabled ifFalse: [^ self].
	(anEvent hand hasSubmorphs)
		ifTrue: [^ self].
	oldColor 
		ifNotNil: [
			self fillStyle: oldColor.
			oldColor := nil].
	aTransferMorph := self model transferFor: self model from: self.
	aTransferMorph align: aTransferMorph draggedMorph center with: anEvent position.
	anEvent hand grabMorph: aTransferMorph.
	anEvent hand releaseMouseFocus: self
]

{
	#category : #theme,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>themedFillStyle [
	^ self theme morphTreeColumnFillStyleFor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumnButton>>wantsDroppedMorph: aMorph event: anEvent  [
	^ model container columnDropUnabled and: [(aMorph isTransferable) and: [(aMorph passenger isKindOf: MorphTreeColumn) and: [aMorph passenger ~= self model]]]
]
