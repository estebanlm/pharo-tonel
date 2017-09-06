"
A resizer morph for a morphic based tree
"
Class {
	#name : #MorphTreeResizerMorph,
	#superclass : #AbstractResizerMorph,
	#instVars : [
		'traceMorph',
		'oldColor',
		'index',
		'container'
	],
	#category : #Morphic-Widgets-Tree,
	#timestamp : 'TorstenBergmann 9/5/2014 15:29'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph class>>container: aTreeList index: anInteger [
	^ self new container: aTreeList index: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph class>>fastSplitterResize [
	^ true
]

{
	#category : #Polymorph-Widgets,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>adoptPaneColor: paneColor  [
	"Change our color too."
	super adoptPaneColor: paneColor.
	self fillStyle: self normalFillStyle
]

{
	#category : #'private - testing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>canResizeColumn [
	^(container columns at: index) resizable

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>container: aTreeMorph index: anInteger [
	container := aTreeMorph.
	index := anInteger
]

{
	#category : #'dependents access',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>delete [
	super delete.
	self release.
	
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>drawOn: aCanvas [
	(owner notNil and: [owner containsPoint: self position])
		ifTrue: [super drawOn: aCanvas]

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>getOldColor [
	^ oldColor ifNil: [Color transparent]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>mouseDown: anEvent  [
	"A mouse button has been pressed.
	Update the color for feedback and store the mouse
	position and relative offset to the receiver."
	| cp |
	self canResizeColumn ifFalse: [^ self].
	(self bounds containsPoint: anEvent cursorPoint)
		ifTrue: [oldColor := self color.
			self setGrabbedColor].
	cp := anEvent cursorPoint.
	lastMouse := {cp. cp - self position}
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>mouseEnter: anEvent [
	self canResizeColumn ifFalse: [^ self].
	(owner notNil and: [owner bounds containsPoint: anEvent position]) 
		ifTrue: [super mouseEnter: anEvent]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>mouseLeave: anEvent [
	self canResizeColumn ifFalse: [^ self].
	super mouseLeave: anEvent
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>mouseMove: anEvent  [
	self canResizeColumn ifFalse: [^ self].
	anEvent hand temporaryCursor
		ifNil: [^ self].
	self class fastSplitterResize
		ifTrue: [traceMorph
				ifNil: [traceMorph := Morph newBounds: self bounds.
					traceMorph borderColor: Color lightGray.
					traceMorph borderWidth: 1.
					self owner addMorph: traceMorph].
			traceMorph position: (anEvent cursorPoint x - lastMouse second x) @ traceMorph position y]
		ifFalse: [self updateFromEvent: anEvent]
]

{
	#category : #Polymorph-Widgets,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>mouseUp: anEvent [
	"Change the cursor back to normal if necessary and change the color back to normal."
	
	self canResizeColumn ifFalse: [^ self].
	(self bounds containsPoint: anEvent cursorPoint)
		ifFalse: [anEvent hand showTemporaryCursor: nil].
	self class fastSplitterResize
		ifTrue: [self updateFromEvent: anEvent].
	traceMorph ifNotNil: [traceMorph delete. traceMorph := nil].
	self adoptPaneColor: self paneColor.
	self triggerEvent: #mouseUp
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>normalFillStyle [
	"Return the normal fillstyle for the receiver."
	^ self theme morphTreeSplitterNormalFillStyleFor: self
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>normalizedX: x [

	^ x
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>normalizedY: y  [
	^y
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>pressedFillStyle [
	"Return the pressed fillStyle of the receiver."
	^ self theme morphTreeSplitterPressedFillStyleFor: self
]

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>release [
	traceMorph := nil.
	oldColor := nil.
	container := nil.
	self releaseActionMap. "we are not sure if we need it"
	super release.
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>resizeCursor [
	^ Cursor resizeForEdge: #left
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>setGrabbedColor [
	"Set the color of the receiver when it is grabbed."
	
	self fillStyle: self pressedFillStyle
]

{
	#category : #Polymorph-Widgets,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>shouldDraw [
	^ true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>splitsTopAndBottom [
	^ false
]

{
	#category : #Polymorph-Widgets,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>themeChanged [
	"Update the fill style."
	self fillStyle: self normalFillStyle.
	super themeChanged
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeResizerMorph>>updateFromEvent: anEvent  [
	"Update the splitter and attached morph positions from
	the mouse event.
	Take into account the mouse down offset."
	| pNew previousX newWidth minX newLeft |
	pNew := anEvent cursorPoint - lastMouse second.
	minX := index = 1 
		ifTrue: [container minResizerX] 
		ifFalse: [(container columnResizers at: index - 1) right + container minResizerOffset].
	newLeft := minX max: pNew x.
	index = 1 
		ifTrue: [newLeft := newLeft + 3].
	self left: newLeft.
	previousX := index = 1
		ifTrue: [container scroller left - container scroller offset x + 3] 
		ifFalse: [(container columnResizers at: index - 1) left].
	newWidth := self left - previousX.
	(container columns at: index) currentWidth: newWidth.
	container resizerChanged
]
