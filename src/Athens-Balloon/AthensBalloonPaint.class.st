"
i am an abstract root of many balloon-specific paints
"
Class {
	#name : #AthensBalloonPaint,
	#superclass : #AthensPaint,
	#category : #Athens-Balloon,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPaint>>asAthensPaintOn: surf [
	^ self 
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPaint>>asStrokePaintOn: aCanvas [
	^ AthensBalloonStrokePaint new fillPaint: self
]
