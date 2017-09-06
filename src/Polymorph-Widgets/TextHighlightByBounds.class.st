"
Definition of a clickable highlighted range of text with optional borders.
"
Class {
	#name : #TextHighlightByBounds,
	#superclass : #Object,
	#instVars : [
		'color',
		'lineRange',
		'bounds',
		'borderWidth',
		'borderColor',
		'borderSides',
		'fillWidth'
	],
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 11:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>borderColor [
	"Answer the value of borderColor"

	^ borderColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>borderColor: anObject [
	"Set the value of borderColor"

	borderColor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>borderSides [
	"Answer the value of borderSides"

	^ borderSides
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>borderSides: anObject [
	"Set the value of borderSides"

	borderSides := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>borderWidth [
	"Answer the value of borderWidth"

	^ borderWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>borderWidth: anObject [
	"Set the value of borderWidth"

	borderWidth := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>bounds [
	"Answer the value of bounds"

	^ bounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>bounds: anObject [
	"Set the value of bounds"

	bounds := anObject
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>clicked: evt [
	"The receiver has had a mouse down."

	self triggerEvent: #clicked
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>color [
	"Answer the value of color"

	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>color: anObject [
	"Set the value of color"

	color := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>containsPoint: aPoint in: rect [
	"Answer whther the bounds contain the given (local coordinate) point."

	|r|
	r := self bounds ifNil: [^ false ].
	r := self fillWidth
		ifTrue: [rect left @ r top corner: (rect right @ r bottom)]
		ifFalse: [r]. 
	^r containsPoint: aPoint
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>drawOn: aCanvas in: rect offset: o [
	"Draw the highlight on the given canvas for the given rectangle."

	| r |
	r := self fillWidth
		ifTrue: [ rect left @ (self bounds top + rect top) corner: rect right @ (self bounds bottom + rect top) ]
		ifFalse: [ self bounds translateBy: rect topLeft ].
	r := r
		translateBy:
			(self fillWidth
				ifTrue: [ 0 @ o y negated ]
				ifFalse: [ o negated ]).
	self color isTransparent
		ifFalse: [ aCanvas fillRectangle: r color: self color ].
	(self borderWidth > 0 and: [ self borderColor isTransparent not ])
		ifTrue: [ 
			(self borderSides includes: #top)
				ifTrue: [ aCanvas fillRectangle: (r withHeight: self borderWidth) color: self borderColor ].
			(self borderSides includes: #right)
				ifTrue: [ aCanvas fillRectangle: (r withLeft: r right - self borderWidth) color: self borderColor ].
			(self borderSides includes: #bottom)
				ifTrue: [ aCanvas fillRectangle: (r withTop: r bottom - self borderWidth) color: self borderColor ].
			(self borderSides includes: #left)
				ifTrue: [ aCanvas fillRectangle: (r withWidth: self borderWidth) color: self borderColor ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>fillWidth [
	"Answer the value of fillWidth"

	^ fillWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>fillWidth: anObject [
	"Set the value of fillWidth"

	fillWidth := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		color: Color yellow;
		lineRange: (1 to: 0);
		borderWidth: 0;
		borderColor: Color transparent;
		borderSides: #(top right bottom left);
		fillWidth: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>lineNumber [
	"Answer the first in the line range."

	^self lineRange first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>lineRange [
	"Answer the value of lineRange"

	^ lineRange
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>lineRange: anObject [
	"Set the value of lineRange"

	lineRange := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>position [
	"Answer the bounds top left."
	
	^self bounds topLeft
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextHighlightByBounds>>position: aPoint [
	"Set the bounds top left."
	
	self bounds: (aPoint extent: self bounds extent)
]
