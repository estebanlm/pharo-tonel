"

"
Class {
	#name : #GTSpotterExceptionMock5,
	#superclass : #Object,
	#category : #GT-Tests-Spotter-Exceptions-Mocks,
	#timestamp : ''
}

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterExceptionMock5>>mockProcessorFor: aSpotterStep [
	" No Exceptions expected ! "
	<spotterOrder: 1>
	self assert: GTCurrentSpotterExceptionHandler value notNil.
	self assert: GTCurrentSpotterExceptionHandler value == aSpotterStep spotter exceptionHandler. 
	aSpotterStep listProcessor
		allCandidates: [
			self assert: GTCurrentSpotterExceptionHandler value notNil.
			self assert: GTCurrentSpotterExceptionHandler value == aSpotterStep spotter exceptionHandler. 
			#( 1 2 3 ) ];
		itemName: [ :item | 
			self assert: GTCurrentSpotterExceptionHandler value notNil.
			self assert: GTCurrentSpotterExceptionHandler value == aSpotterStep spotter exceptionHandler.
			item asString ];
		filter: GTSpotterExceptionMock5Filter
]
