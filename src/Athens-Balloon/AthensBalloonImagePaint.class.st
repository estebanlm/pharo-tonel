"
i representing an image (form) paint  
"
Class {
	#name : #AthensBalloonImagePaint,
	#superclass : #AthensPaint,
	#instVars : [
		'form',
		'origin',
		'direction',
		'tileFlag'
	],
	#category : #Athens-Balloon,
	#timestamp : '<historical>'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>athensFillPath: aPath on: anAthensCanvas [

	anAthensCanvas surface engine
		prepareForRendering;
		registerFormFill: form origin: origin direction: direction normal: self normal;
		fillBezierShape: aPath contoursForFilling
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>athensFillRectangle: aRect on: anAthensCanvas [
	"This is a terminal method in rendering dispatch scheme
	canvas->shape->paint. See AthensCanvas>>fillShape: "
	|rotation normal|
	rotation := anAthensCanvas surface paintTransform transform: direction.
	normal := anAthensCanvas surface paintTransform transform:self normal.
	

	anAthensCanvas surface engine reset
		prepareForRendering;
		registerFormFill: form origin: origin direction: rotation normal: normal tileFlag: tileFlag;
		fillRectangle: aRect

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>direction [

	^ direction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>direction: anObject [

	direction := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>form [

	^ form
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>form: anObject [

	form := anObject.
	origin := 0@0.
	direction := form extent x @0.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>initialize [

	super initialize.

	direction := 0@0.
	form := nil.
	origin := 0@0.
	tileFlag := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>normal [
	^ ((direction y negated @ direction x) *  form height / form width ) rounded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>origin [

	^ origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>origin: anObject [

	origin := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonImagePaint>>repeat [
	tileFlag:=true
]
