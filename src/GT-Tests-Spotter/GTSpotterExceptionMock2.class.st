"

"
Class {
	#name : #GTSpotterExceptionMock2,
	#superclass : #Object,
	#category : #GT-Tests-Spotter-Exceptions-Mocks,
	#timestamp : ''
}

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterExceptionMock2>>mockProcessorFor: aSpotterStep [
	<spotterOrder: 1>
	aSpotterStep listProcessor
		allCandidates: [ nil ]; " Exception while collecting candidates "
		itemName: [ :item | item asString ];
		filter: GTFilterSubstring
]
