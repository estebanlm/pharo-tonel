"

"
Class {
	#name : #GTSpotterExceptionMock4Filter,
	#superclass : #GTFilter,
	#category : #GT-Tests-Spotter-Exceptions-Mocks,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterExceptionMock4Filter>>value: aSpotterContext [
	ArithmeticError signal: 'Error while filtering' " Exception while filtering "
]
