"

"
Class {
	#name : #FLProcessSerializationTest,
	#superclass : #FLBasicSerializationTest,
	#category : #FuelTests,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLProcessSerializationTest>>setUpSerializer [
	^ serializer := FLDelayedSerializerMock newDefault
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLProcessSerializationTest>>testSerializingShortDelay [
	| process |
	process := [ 2 timesRepeat: [ | d |
		d := Delay forMilliseconds: 50.
		d wait ] ] forkAt: Processor userBackgroundPriority.
	
	self 
		shouldnt: [ self serialize: process ]
		raise: FLObjectNotFound
]
