"
i am used to convert 
ComplexBorder (raised/inset) into paint, used in Morphic.
"
Class {
	#name : #AthensBorderStrokePaint,
	#superclass : #AthensPaint,
	#instVars : [
		'topLeftPaint',
		'bottomRightPaint',
		'width'
	],
	#category : #Athens-Morphic,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint class>>topLeftColor: aColor1 bottomRightColor: aColor2 width: aNumber on: anAthensCanvas [
	^ self new
		topLeftPaint: (aColor1 asAthensPaintOn: anAthensCanvas);
		bottomRightPaint: (aColor2 asAthensPaintOn: anAthensCanvas);
		width: aNumber;
		yourself
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint>>asStrokePaintOn: aCanvas [
	"receiver is stroke paint already"
	^ self
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint>>athensFillRectangle: aRect on: anAthensCanvas [
	"This is a terminal method in rendering dispatch scheme
	canvas->shape->paint. See AthensCanvas>>fillShape: "

	topLeftPaint
		athensFillPath: (self pathForTopLeftBorderOf: (aRect expandBy: width/2.0) on: anAthensCanvas)
		on: anAthensCanvas.
	bottomRightPaint
		athensFillPath: (self pathForBottomRightBorderOf: (aRect expandBy: width/2.0) on: anAthensCanvas)
		on: anAthensCanvas
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint>>bottomRightPaint: anAthensPaint [
	bottomRightPaint := anAthensPaint
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint>>pathForBottomRightBorderOf: aRectangle on: anAthensCanvas [
	^ anAthensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveToX: aRectangle left Y: aRectangle bottom;
				lineToX: aRectangle right Y: aRectangle bottom;
				lineToX: aRectangle right Y: aRectangle top;
				lineToX: aRectangle right - width Y: aRectangle top + width;
				lineToX: aRectangle right - width Y: aRectangle bottom - width;
				lineToX: aRectangle left + width Y: aRectangle bottom - width;
				close ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint>>pathForTopLeftBorderOf: aRectangle on: anAthensCanvas [
	^ anAthensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveToX: aRectangle left Y: aRectangle bottom;
				lineToX: aRectangle left Y: aRectangle top;
				lineToX: aRectangle right Y: aRectangle top;
				lineToX: aRectangle right - width Y: aRectangle top + width;
				lineToX: aRectangle left + width Y: aRectangle top + width;
				lineToX: aRectangle left + width Y: aRectangle bottom - width;
				close ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint>>topLeftPaint: anAthensPaint [
	topLeftPaint := anAthensPaint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint>>width [
	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBorderStrokePaint>>width: aWidth [
	width:= aWidth
]
