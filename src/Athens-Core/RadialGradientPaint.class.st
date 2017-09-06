"
I represent a radial gradient paint.

The center point and radius defining a circle where gradient will be drawn in user space coordinates.

The gradient's ramp color at 0 maps to the focal point and ramp color at 1 maps to the edge of the circle,
interpolating colors in between.

Also check the comment of my superclass to know better how and when you can use me.

"
Class {
	#name : #RadialGradientPaint,
	#superclass : #GradientPaint,
	#instVars : [
		'center',
		'radius',
		'focalPoint'
	],
	#category : #Athens-Core-Paints,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
RadialGradientPaint>>asAthensPaintOn: aCanvas [
	^ aCanvas surface
		createRadialGradient:  colorRamp
		center: center
		radius: radius
		focalPoint: focalPoint 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
RadialGradientPaint>>center [
	
	^ center
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
RadialGradientPaint>>center: aPoint [

	center := aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
RadialGradientPaint>>focalPoint [
	
	^ focalPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
RadialGradientPaint>>focalPoint: aPoint [

	focalPoint := aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
RadialGradientPaint>>radius [
	
	^ radius
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
RadialGradientPaint>>radius: aNumber [

	radius := aNumber
]
