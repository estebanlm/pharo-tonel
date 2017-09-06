"
i represent a radial gradient paint in balloon backend.
"
Class {
	#name : #AthensBalloonRadialGradient,
	#superclass : #AthensBalloonGradientPaint,
	#instVars : [
		'center',
		'radius'
	],
	#category : #Athens-Balloon,
	#timestamp : '<historical>'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonRadialGradient>>athensFillPath: aPath on: anAthensCanvas [
	"This is a terminal method in rendering dispatch scheme
	canvas->shape->paint. See AthensCanvas>>fillShape: "
	
	| c |

	c := anAthensCanvas paintTransform transform: center.

	^ anAthensCanvas surface engine
		prepareForRendering;
		registerRadialGradient: colorRamp center: c radius: radius;
		fillBezierShape: aPath contoursForFilling

]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonRadialGradient>>athensFillRectangle: aRect on: anAthensCanvas [
	"This is a terminal method in rendering dispatch scheme
	canvas->shape->paint. See AthensCanvas>>fillShape: "
	
	| c dir n |

	c := anAthensCanvas paintTransform transform: center.
	dir :=  (radius@0).
	n := (0@radius).
	
	^ anAthensCanvas surface engine
		prepareForRendering;
		registerRadialGradient: colorRamp center: c direction: dir normal: n;
		fillRectangle: aRect
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonRadialGradient>>center [

	^ center
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonRadialGradient>>center: anObject [

	center := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonRadialGradient>>radius [

	^ radius
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonRadialGradient>>radius: anObject [

	radius := anObject
]
