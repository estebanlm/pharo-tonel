"
Test mock for a weak class
"
Class {
	#name : #FLWeakClassMock,
	#superclass : #FLPair,
	#type : #weak,
	#instVars : [
		'instVar1'
	],
	#category : #FuelTests-Mocks,
	#timestamp : 'TorstenBergmann 2/3/2014 23:23'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLWeakClassMock>>instVar1 [
	^ instVar1 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLWeakClassMock>>instVar1: anObject [
	instVar1 := anObject
]
