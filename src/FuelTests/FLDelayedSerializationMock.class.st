"

"
Class {
	#name : #FLDelayedSerializationMock,
	#superclass : #FLSerialization,
	#category : #FuelTests-Mocks,
	#timestamp : ''
}

{
	#category : #serializing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLDelayedSerializationMock>>run [
	"Serialize the graph starting at the root object."

	self analysisStep.
	self headerStep.
	self instancesStep.
	(Delay forMilliseconds: 100) wait.
	self referencesStep.
	self trailerStep.
]
