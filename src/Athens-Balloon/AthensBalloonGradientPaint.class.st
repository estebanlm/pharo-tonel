"
my subclasses used internally in balloon backend for Athens to represenet gradient paints.
"
Class {
	#name : #AthensBalloonGradientPaint,
	#superclass : #AthensBalloonPaint,
	#instVars : [
		'colorRamp'
	],
	#category : #Athens-Balloon,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonGradientPaint>>colorRamp [

	^ colorRamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonGradientPaint>>colorRamp: anObject [

	colorRamp := anObject
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonGradientPaint>>strokeRect: aRectangle on: anAthensCanvas stroke: anAthensBalloonStrokePaint  [
	self shouldBeImplemented.
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonGradientPaint>>strokeRect: aRectangle on: anAthensCanvas strokeWidth: strokeWidth [
	self shouldBeImplemented.
]
