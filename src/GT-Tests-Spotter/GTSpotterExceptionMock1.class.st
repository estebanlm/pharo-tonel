"

"
Class {
	#name : #GTSpotterExceptionMock1,
	#superclass : #Object,
	#category : #GT-Tests-Spotter-Exceptions-Mocks,
	#timestamp : ''
}

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterExceptionMock1>>messageText [
	^ self class name
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterExceptionMock1>>mockProcessorFor: aSpotterStep [
	<spotterOrder: 1>
	AssertionFailure signal: self messageText " Exception while creating the processor "
]
