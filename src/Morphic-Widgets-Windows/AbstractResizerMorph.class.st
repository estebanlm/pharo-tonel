"
I am the superclass of a hierarchy of morph specialized in allowing the user to resize or rearrange windows and panes.
"
Class {
	#name : #AbstractResizerMorph,
	#superclass : #Morph,
	#instVars : [
		'dotColor',
		'handleColor',
		'lastMouse'
	],
	#category : #Morphic-Widgets-Windows-Resizing,
	#timestamp : 'jmv 1/29/2006 17:15'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>adoptPaneColor: paneColor [
	"Just get the resizer fill style for the theme."
	
	paneColor ifNil: [^super adoptPaneColor: paneColor].
	self fillStyle: (self theme resizerGripNormalFillStyleFor: self)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>dotColor [

	^ dotColor ifNil: [self setDefaultColors. dotColor]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>handleColor [

	^ handleColor ifNil: [self setDefaultColors. handleColor]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>handlesMouseOver: anEvent [

	^ true
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>initialize [

	super initialize.
	self color: Color transparent
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>isCursorOverHandle [

	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>mouseDown: anEvent [

	lastMouse := anEvent cursorPoint
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>mouseEnter: anEvent [

	self isCursorOverHandle ifTrue:
		[self setInverseColors.
		self shouldInvalidateOnMouseTransition ifTrue: [self changed]. "avoid unnecessary invalidation"
		anEvent hand showTemporaryCursor: self resizeCursor]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>mouseLeave: anEvent [

	anEvent hand showTemporaryCursor: nil.
	self setDefaultColors.
	self shouldInvalidateOnMouseTransition ifTrue: [self changed]. 
	"avoid unnecessary invalidation"
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>mouseUp: anEvent [
	"Change the cursor back to normal if necessary."
	
	(self bounds containsPoint: anEvent cursorPoint) ifFalse: [
		anEvent hand showTemporaryCursor: nil.
		self
			setDefaultColors;
			changed]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>resizeCursor [

	self subclassResponsibility
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>setDefaultColors [

	handleColor := Color lightGray lighter lighter.
	dotColor := Color gray lighter
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>setInverseColors [

	handleColor := Color lightGray.
	dotColor := Color white
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>shouldDraw [
	"Answer whether the resizer should be drawn."
	
	^self fillStyle isTransparent not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractResizerMorph>>shouldInvalidateOnMouseTransition [
	"Answer whether the resizer should be invalidated
	when the mouse enters or leaves."
	
	^false
]
