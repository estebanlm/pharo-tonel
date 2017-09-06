"
Mouse over handler in a hand morph
"
Class {
	#name : #MouseOverHandler,
	#superclass : #Object,
	#instVars : [
		'mouseOverMorphs',
		'enteredMorphs',
		'overMorphs',
		'leftMorphs'
	],
	#category : #Morphic-Core-Events,
	#timestamp : 'TorstenBergmann 2/20/2014 18:29'
}

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>handleAsMouseEnter: anEvent  [

	| asMouseEnterEvent |
	
	asMouseEnterEvent := anEvent asMouseEnter.
	enteredMorphs := enteredMorphs contents.
	enteredMorphs reverseDo: [ :anEnteredMorph | 
		self inform: asMouseEnterEvent to: anEnteredMorph originatedFrom: anEvent ifNotFocusedDo: [] ]
]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>handleAsMouseLeave: anEvent  [

	self keepLeftMorphsOrder.
	self informMouseLeaveToLeftMorphsUsing: anEvent

]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>handleAsMouseOver: anEvent  [

	anEvent hand handleEvent: anEvent asMouseOver.

]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>hasLeftMorphsChanged [

	^(leftMorphs isEmpty and: [ enteredMorphs position = 0 ]) not
]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>inform: evt to: aLeftMorph originatedFrom: anEvent ifNotFocusedDo: aBlock [

	^ (self is: anEvent withFocusOver: aLeftMorph) 
		ifTrue: [ self transform: evt from: anEvent andSendTo: aLeftMorph ]
		ifFalse: aBlock
]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>informMouseLeaveToLeftMorphsUsing: anEvent  [

	| asMouseLeaveEvent |
	
	asMouseLeaveEvent := anEvent asMouseLeave.
	
	leftMorphs do: [ :aLeftMorph | 
		self inform: asMouseLeaveEvent to: aLeftMorph originatedFrom: anEvent ifNotFocusedDo: [ overMorphs nextPut: aLeftMorph ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>initialize [
	mouseOverMorphs := #().
	
	self initializeTrackedMorphs
	
]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>initializeProcessMouseOver [

	leftMorphs := mouseOverMorphs asIdentitySet.
	overMorphs := WriteStream on: (Array new: leftMorphs size).
	enteredMorphs := WriteStream on: #()
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>initializeTrackedMorphs [

	leftMorphs := OrderedCollection new.
	overMorphs := WriteStream on: #().
	enteredMorphs := WriteStream on: #().
	
]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>is: anEvent withFocusOver: aMorph  [

	| focusedMorph |
	
	focusedMorph := anEvent hand mouseFocus.
	^ aMorph = focusedMorph or: [ aMorph hasOwner: focusedMorph ]
]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>keepLeftMorphsOrder [

	leftMorphs size > 1 ifTrue: [ leftMorphs := mouseOverMorphs intersection: leftMorphs ]
	
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>noticeMouseOver: aMorph event: anEvent [
	"Remember that the mouse is currently over some morph"

	leftMorphs remove: aMorph ifAbsent: [ enteredMorphs nextPut: aMorph ].
	overMorphs nextPut: aMorph.

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>processMouseOver: anEvent  [

	self initializeProcessMouseOver.
	self handleAsMouseOver: anEvent.
	self hasLeftMorphsChanged ifTrue: [ 
		self handleAsMouseLeave: anEvent.
		self handleAsMouseEnter: anEvent.
		self rememberOverList ].
	
	self initializeTrackedMorphs 

]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>rememberOverList [

	mouseOverMorphs := overMorphs contents.

]

{
	#category : #'event handling - private',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseOverHandler>>transform: anEvent from: originalEvent andSendTo: aMorph [

	| transformedEvent |

	transformedEvent := anEvent transformedBy: (aMorph transformedFrom: originalEvent hand).
	^ aMorph handleEvent: transformedEvent
]
