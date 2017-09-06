"
Notify about an exception while simulating an execution
"
Class {
	#name : #SimulationExceptionWrapper,
	#superclass : #Exception,
	#instVars : [
		'exception'
	],
	#category : #Kernel-Exceptions,
	#timestamp : 'TorstenBergmann 2/4/2014 21:43'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:33'
}
SimulationExceptionWrapper class>>signalForException: anError [

	^ self new
		exception: anError
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SimulationExceptionWrapper>>exception [

	^ exception
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
SimulationExceptionWrapper>>exception: anObject [

	exception := anObject
]
