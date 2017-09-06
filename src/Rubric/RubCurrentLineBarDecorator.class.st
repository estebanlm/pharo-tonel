"

"
Class {
	#name : #RubCurrentLineBarDecorator,
	#superclass : #RubParagraphDecorator,
	#category : #Rubric-Editing-Core,
	#timestamp : ''
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCurrentLineBarDecorator class>>key [
	^ #selectionBar
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCurrentLineBarDecorator>>drawOn: aCanvas [
 
	| line bnd |
	
	aCanvas isShadowDrawing ifTrue: [ ^self ].
	
	self selectionStart = self selectionStop ifFalse: [^self].
	
	line := self selectionStart textLine.
	bnd := (line topLeft - (self margins left @ 0)) corner: (line bottomRight + (self margins right @ 0)).
	aCanvas fillRectangle: bnd color: self selectionBarColor
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCurrentLineBarDecorator>>drawOnAthensCanvas: anAthensCanvas [
	| line bnd |
	super drawOnAthensCanvas: anAthensCanvas.
	self selectionStart = self selectionStop ifFalse: [^self].
	line := self selectionStart textLine.
	bnd := (line topLeft - (self margins left @ 0)) corner: ((line bottomRight + (self margins right @ 0)) min: anAthensCanvas clipRect bottomRight).
	anAthensCanvas setPaint: self selectionBarColor.
	anAthensCanvas setShape: bnd.
	anAthensCanvas draw 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCurrentLineBarDecorator>>selectionBarColor [
	^ self theme selectionBarColor
]
