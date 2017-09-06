"
I'm a simple test ressource for test purposes
"
Class {
	#name : #SimpleTestResource,
	#superclass : #TestResource,
	#instVars : [
		'runningState',
		'hasRun',
		'hasSetup'
	],
	#classInstVars : [
		'preventAvailability'
	],
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:13'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource class>>allowAvailability [
	^preventAvailability isNil
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource class>>preventAvailabilityDuring: aBlock [
	"Only setter of preventAvailability."
	
	preventAvailability := false.
	^aBlock ensure: [preventAvailability := nil]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource class>>rawCurrentForTest [
	^current
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>hasRun [
	^hasRun
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>hasSetup [
	^hasSetup
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>isAvailable [
	^self class allowAvailability
		and: [self runningState == self startedStateSymbol]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>runningState [

	^runningState
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>runningState: aSymbol [

	runningState := aSymbol
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>setRun [
	hasRun := true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>setUp [
	
	self runningState: self startedStateSymbol.
	hasSetup := true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>startedStateSymbol [

	^#started
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>stoppedStateSymbol [

	^#stopped
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResource>>tearDown [

	self runningState: self stoppedStateSymbol
]
