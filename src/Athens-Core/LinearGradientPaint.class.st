"
I represent a linear gradient paint.
My start and stop points defining 
the position and direction of gradient fill 
in user space coordinates,
so that the ramp color at 0 maps to starting point
and ramp color at 1 maps to stop point of linear gradient.



Also check the comment of my superclass to know better how and when you can use me.

"
Class {
	#name : #LinearGradientPaint,
	#superclass : #GradientPaint,
	#instVars : [
		'start',
		'stop'
	],
	#category : #Athens-Core-Paints,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:26'
}
LinearGradientPaint class>>from: aStartPoint  to: aStopPoint [
	^ self new start: aStartPoint; stop: aStopPoint; yourself.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
LinearGradientPaint>>asAthensPaintOn: aCanvas [
	^ aCanvas surface
			createLinearGradient: self colorRamp
				start: self start 
				stop: self stop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
LinearGradientPaint>>start [

	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
LinearGradientPaint>>start: anObject [
	
	start := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
LinearGradientPaint>>stop [

	^ stop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
LinearGradientPaint>>stop: anObject [
	
	stop := anObject
]
