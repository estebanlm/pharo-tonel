"

"
Class {
	#name : #RubGhostTextDisplayer,
	#superclass : #RubScrolledTextExtraSurface,
	#instVars : [
		'ghostText',
		'textColor'
	],
	#category : #Rubric-Editing-Widgets,
	#timestamp : ''
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer class>>key [
	^ #ghostText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>bold [
	self handleTextChangeWhile: [ghostText selectAll; bold; deselect]

]

{
	#category : #alignment,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>centered [
	self handleTextChangeWhile: [ ghostText centered ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>computedPositionFrom: aRectangle [
	^ self scrollBounds topLeft

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>computedWidthFrom: aRectangle [
	^  self scrollBounds width

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>defaultTextColor. [
	^ Color lightGray
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>extent: aPoint [
	super extent: aPoint.
	self showHideGhostText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>font: aFont [
	self handleTextChangeWhile: [ghostText textFont: aFont]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>fontName: aFontName pointSize: anInteger [
	self
		handleTextChangeWhile: [ 
			ghostText
				beEditableWhile: [ 
					ghostText fontName: aFontName pointSize: anInteger.
					ghostText compose.
					self changed ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>fontPointSize: anInteger [
	self handleTextChangeWhile: [ghostText fontPointSize: anInteger]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>handleTextChangeWhile: aBlock  [
	aBlock value.
	self showHideGhostText
]

{
	#category : #alignment,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>leftFlush [
	self handleTextChangeWhile: [ ghostText leftFlush ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>level [
	^ SmallInteger maxVal  - 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>manageLayoutInBounds: aRectangle [
	| ret |
	self handleTextChangeWhile: [ ret := super manageLayoutInBounds: aRectangle ].
	^ ret
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>noteNewOwner: aMorph [
	super noteNewOwner: aMorph.
	ghostText := self paragraphProvider defaultGhostTextMorph.
	textColor := self defaultTextColor. 
	self textArea announcer when: MorphGotFocus send: #showHideGhostText to: self.	
	self textArea announcer when: MorphLostFocus send: #showHideGhostText to: self.
]

{
	#category : #alignment,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>rightFlush [
	self
		handleTextChangeWhile: [ ghostText rightFlush ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>setTextWith: aText [
	ghostText setTextWith: aText asText.
	ghostText  textColor: self textColor

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>showHideGhostText [
	self textArea text
		ifNotEmpty: [ self removeAllMorphs ]
		ifEmpty: [ 
			self paragraphProvider configureGhostText: ghostText.
			self addMorph: ghostText ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>textChanged  [
	self showHideGhostText.
	super textChanged

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>textColor [
	^ textColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>textColor: aColor [
	textColor := aColor.
	self
		handleTextChangeWhile: [ ghostText textColor: aColor ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>updateMarginsWith: aRectangle [
	self
		handleTextChangeWhile: [ ghostText updateMarginsWith: aRectangle]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGhostTextDisplayer>>updateTextWith: aText [
	self
		handleTextChangeWhile: [ 
			ghostText updateTextWith: aText.
			ghostText textColor: self textColor ]
]
