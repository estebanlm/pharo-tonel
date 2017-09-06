"
A test mock where a new instance is enforced
"
Class {
	#name : #FLSingletonMockEnforced,
	#superclass : #FLSingletonMock,
	#category : #FuelTests-Mocks,
	#timestamp : 'TorstenBergmann 2/3/2014 23:29'
}

{
	#category : #fuel,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSingletonMockEnforced class>>fuelNew [
	^ self instance
]
