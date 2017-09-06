"
Border with customisable inner margin.
"
Class {
	#name : #MarginBorder,
	#superclass : #SimpleBorder,
	#instVars : [
		'margin'
	],
	#category : #Morphic-Base-Borders,
	#timestamp : 'gvc 5/18/2007 12:46'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MarginBorder>>drawLineFrom: startPoint to: stopPoint on: aCanvas [
	"Reduce the width by the margin."
	
	| lineColor |
	lineColor := (stopPoint truncated quadrantOf: startPoint truncated) > 2 
				ifTrue: [self topLeftColor]
				ifFalse: [self bottomRightColor].
	aCanvas 
		line: startPoint
		to: stopPoint 
		width: (self width - self margin max: 0)
		color: lineColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MarginBorder>>frameRectangle: aRectangle on: aCanvas [
	"Reduce width by the margin."
	
	aCanvas frameAndFillRectangle: aRectangle
		fillColor: Color transparent
		borderWidth: (self width - self margin max: 0)
		topLeftColor: self topLeftColor
		bottomRightColor: self bottomRightColor.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
MarginBorder>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		margin: 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MarginBorder>>margin [
	"Answer the value of margin"

	^ margin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
MarginBorder>>margin: anObject [
	"Set the value of margin"

	margin := anObject
]
