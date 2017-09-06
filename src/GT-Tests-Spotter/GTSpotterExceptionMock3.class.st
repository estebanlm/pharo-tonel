"

"
Class {
	#name : #GTSpotterExceptionMock3,
	#superclass : #Object,
	#category : #GT-Tests-Spotter-Exceptions-Mocks,
	#timestamp : ''
}

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterExceptionMock3>>mockProcessorFor: aSpotterStep [
	<spotterOrder: 1>
	aSpotterStep listProcessor
		allCandidates: [ #( 1 2 3 ) ];
		itemName: [ :item | item / 0 ]; " Exception while serializing candidates "
		filter: GTFilterSubstring
]
