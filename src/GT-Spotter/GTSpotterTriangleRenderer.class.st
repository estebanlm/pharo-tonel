"

"
Class {
	#name : #GTSpotterTriangleRenderer,
	#superclass : #GLMBrickRenderer,
	#instVars : [
		'orientation',
		'border',
		'borderColor'
	],
	#category : #GT-Spotter-Renderer,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>border [
	^ border
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>border: anInteger [
	border := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>borderColor [
	^ borderColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>borderColor: aColor [
	borderColor := aColor
]

{
	#category : #'mathematical functions',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>findTriangleEdgeLength: anInteger [

	^ 2 / 3 * (3 sqrt) * anInteger
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>initialize [
	super initialize.
	
	border := 0.
	borderColor := Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>orientation [
	^ orientation ifNil: [ #bottom ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>orientation: aSymbol [
	"can be #right #bottom #left #top"

	orientation := aSymbol
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>render: aBrick on: aCanvas [
	
	self orientation = #right ifTrue: [ self renderRightTriangle: aBrick on: aCanvas ].
	self orientation = #bottom ifTrue: [ self renderBottomTriangle: aBrick on: aCanvas ].
	self orientation = #left ifTrue: [ self renderLeftTriangle: aBrick on: aCanvas ].
	self orientation = #top ifTrue: [ self renderTopTriangle: aBrick on: aCanvas ].
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>renderBottomTriangle: aBrick on: aCanvas [
	|a b c width height|
	
	width := aBrick brickBounds width.
	height := aBrick brickBounds height.
	
	a := aBrick brickBounds topLeft + (((width / 2 - height) max: 0) @ 0).
	b := aBrick brickBounds topLeft + (((width / 2 + height) min: width) @ 0).
	c := aBrick brickBounds bottomLeft + (width / 2 @ 0).
		
	self renderTriangle: aBrick on: aCanvas with: { a asIntegerPoint . b asIntegerPoint . c asIntegerPoint}.
	
	
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>renderLeftTriangle: aBrick on: aCanvas [
	|a b c width height|
	
	width := aBrick brickBounds width.
	height := aBrick brickBounds height.
	
	a := aBrick brickBounds topRight + (0 @ ((height / 2 - width) max: 0)).
	b := aBrick brickBounds topRight + (0 @ ((height / 2 + width) min: height)).
	c := aBrick brickBounds topLeft + (0 @ (height / 2)).
	
	self renderTriangle: aBrick on: aCanvas with: { a asIntegerPoint . b asIntegerPoint . c asIntegerPoint}
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>renderRightTriangle: aBrick on: aCanvas [
	|a b c width height gap|
	
	gap := aBrick themer spotterThemer previewArrowGapHack.
	aCanvas fillRectangle: (aBrick brickBounds withWidth: ((gap - self border)max:0)) color: aBrick color.
	
	width := aBrick brickBounds width - gap.
	height := aBrick brickBounds height.
	
	a := aBrick brickBounds topLeft + (gap @ ((height / 2 - width) max: 0)) - (0@1).
	b := aBrick brickBounds topLeft + (gap @ ((height / 2 + width) min: height)) - (0@self border negated) - (0@self border).
	c := aBrick brickBounds topRight + (0 @ (height / 2)).
	
	self border > 0
		ifTrue: [ 
			self renderTriangle: aBrick on: aCanvas with: { a asIntegerPoint . b asIntegerPoint . c asIntegerPoint } color: self borderColor.
			self renderTriangle: aBrick on: aCanvas with: { a asIntegerPoint - ((self border+1)@0) . b asIntegerPoint - ((self border+1)@0) . c asIntegerPoint - ((self border+1)@0) } ]
		ifFalse: [ 
			self renderTriangle: aBrick on: aCanvas with: { a asIntegerPoint . b asIntegerPoint . c asIntegerPoint }.
		]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>renderTopTriangle: aBrick on: aCanvas [
	|a b c width height|
	
	width := aBrick brickBounds width.
	height := aBrick brickBounds height.
	
	a := aBrick brickBounds bottomLeft + (((width / 2 - height) max: 0) @ 0).
	b := aBrick brickBounds bottomLeft + (((width / 2 + height) min: width) @ 0).
	c := aBrick brickBounds topLeft + (width / 2 @ 0).
	
	self renderTriangle: aBrick on: aCanvas with: { a asIntegerPoint . b asIntegerPoint . c asIntegerPoint}
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>renderTriangle: aBrick on: aCanvas with: aCollection [

	self renderTriangle: aBrick on: aCanvas with: aCollection color: (aBrick currentColor ifNil: [ aBrick color ])
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterTriangleRenderer>>renderTriangle: aBrick on: aCanvas with: aCollection color: aColor [

	aCanvas drawPolygon: aCollection color: aColor borderWidth: 0 borderColor: Color transparent
]
