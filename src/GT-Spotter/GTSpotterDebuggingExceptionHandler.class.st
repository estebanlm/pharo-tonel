"

"
Class {
	#name : #GTSpotterDebuggingExceptionHandler,
	#superclass : #GTSpotterExceptionHandler,
	#category : #GT-Spotter-Exceptions,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterDebuggingExceptionHandler>>handleException: anException do: aBlock [
	anException pass.
	^ super handleException: anException do: aBlock.
	
	
]
