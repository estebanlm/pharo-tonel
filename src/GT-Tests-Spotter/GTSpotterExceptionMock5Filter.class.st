"

"
Class {
	#name : #GTSpotterExceptionMock5Filter,
	#superclass : #GTFilter,
	#category : #GT-Tests-Spotter-Exceptions-Mocks,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterExceptionMock5Filter>>value: aSpotterContext [
	" No Exceptions expected ! "
	| currentExceptionHandler |
	currentExceptionHandler := GTCurrentSpotterExceptionHandler value.
	self assert: currentExceptionHandler notNil.
	self assert: currentExceptionHandler == aSpotterContext exceptionHandler.
	self assert: currentExceptionHandler == aSpotterContext step exceptionHandler.
	self assert: currentExceptionHandler == aSpotterContext spotter exceptionHandler.
	^ #( 'done' )
]
