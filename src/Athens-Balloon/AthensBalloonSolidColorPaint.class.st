"
maybe Color could act as a AthensPaint by itself by implementing a corresponding protocol
"
Class {
	#name : #AthensBalloonSolidColorPaint,
	#superclass : #AthensBalloonPaint,
	#instVars : [
		'color'
	],
	#category : #Athens-Balloon,
	#timestamp : 'IgorStasenko 12/20/2011 15:27'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSolidColorPaint>>athensFillPath: athensBalloonPath on: anAthensCanvas  [

	^ anAthensCanvas surface 
		fillBezierShape: athensBalloonPath contoursForFilling  
		color: color.
		
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSolidColorPaint>>athensFillRectangle: aRect on: canvas [
	"This is a terminal method in rendering dispatch scheme
	canvas->shape->paint. See AthensCanvas>>fillShape: "
	

	^ canvas surface fillRectangle: aRect color: color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSolidColorPaint>>color [

	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSolidColorPaint>>color: anObject [

	color := anObject
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSolidColorPaint>>strokePath: aPath on: anAthensCanvas stroke: strokePaint  [
	
	 anAthensCanvas surface 
		strokeBezierShape: aPath contoursForStroke
		color: color
		width: strokePaint width.
		
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSolidColorPaint>>strokePath: aPath on: anAthensCanvas strokeWidth: strokeWidth [
	
	 anAthensCanvas surface 
		strokeBezierShape: aPath contoursForStroke
		color: color
		width: strokeWidth.
		
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSolidColorPaint>>strokeRect: rect on: canvas stroke: strokePaint [

	^ canvas surface strokeRectangle: rect color: color width: strokePaint width
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSolidColorPaint>>strokeRect: rect on: canvas strokeWidth: strokeWidth [

	^ canvas surface strokeRectangle: rect color: color width: strokeWidth
]
