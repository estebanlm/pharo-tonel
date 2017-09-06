"
TickingSpecWindow new openInWorld
"
Class {
	#name : #TickingSpecWindow,
	#superclass : #SpecWindow,
	#category : #Spec-Core-Widgets-Support,
	#timestamp : 'StephaneDucasse 3/7/2014 10:41'
}

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:18'
}
TickingSpecWindow>>step [
	self model step.
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:18'
}
TickingSpecWindow>>stepTime [

	^ self model stepTime
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:18'
}
TickingSpecWindow>>wantsSteps [
	^ true
]
