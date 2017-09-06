"
RubScrolledTextExtra represents the root of rulers graphical representations (which add specific behavior to the scrolledText on which they are attached).

Subinstances are the graphical representation of the associated decorators defined in the .

 the main methods are 
	- computedExtentFrom:
	- computedHeightFrom: 
	- computedPositionFrom:
	- computedWidthFrom:
	

"
Class {
	#name : #RubScrolledTextExtra,
	#superclass : #Morph,
	#category : #Rubric-Editing-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra class>>classOfRulerNamed: aKey  [
	^ self allSubclasses detect: [ :cls | cls key = aKey ] ifNone: [  ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra class>>key [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>computedExtentFrom: aRectangle [
	^ (self computedWidthFrom: aRectangle) @ (self computedHeightFrom: aRectangle)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>computedHeightFrom: aRectangle [
	^ aRectangle height
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>computedPositionFrom: aRectangle [
	^ aRectangle topLeft
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>computedWidthFrom: aRectangle [
	^ aRectangle width 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>defaultBackgroundColor  [
	^ Color transparent
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>defaultColor [
	^ self defaultBackgroundColor 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>initialize [
	super initialize.
	self clipSubmorphs: true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>isHorizontal [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>isOver [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>isSideRuler [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>isVertical [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>key [
	^self class key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>level [
	^ 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>lineIndexForPoint: aPoint [
	^ self paragraph lineIndexForPoint: aPoint  + (0 @ (self offset y - self bounds top))
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>lines [
	^ self paragraph lines
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>manageLayoutInBounds: aRectangle [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>margins [
	^ self textArea margins
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>offset [
	^ self paragraphProvider scrollPane offset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>paragraph [
	^ self paragraphProvider ifNotNil: [:p | p paragraph]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>paragraphProvider [
	
	^ self ownerThatIsA: RubScrolledTextMorph 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>primarySelectionColor [
	^ self textArea primarySelectionColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>scrollBounds [
	^ self paragraphProvider scrollBounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>scrollPane [
	^ self paragraphProvider scrollPane
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>scrollerOffsetChanged [
	self changed
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>selectionChanged [
	self changed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>selectionStart [
	^ self paragraph selectionStart
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>selectionStop [
	^ self paragraph selectionStop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>text  [
	^ self textArea text
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>textAccepted [
	self changed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>textArea [
	^ self paragraph textArea
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>textChanged [
	self changed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>textStyle [

	^ self textArea textStyle.

]

{
	#category : #structure,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>topRendererOrSelf [
	^self paragraphProvider
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtra>>unplug [
	self paragraphProvider
		ifNotNil: [ 
			self scrollPane ifNotNil: [:sp | sp announcer unsubscribe: self].
			self textArea ifNotNil: [:ts | ts announcer unsubscribe: self ] ].
	super unplug 
]
