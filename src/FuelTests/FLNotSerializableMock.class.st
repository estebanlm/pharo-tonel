"
A test mock which is not serializable
"
Class {
	#name : #FLNotSerializableMock,
	#superclass : #Object,
	#category : #FuelTests-Mocks,
	#timestamp : 'TorstenBergmann 2/3/2014 23:23'
}

{
	#category : #hooks,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLNotSerializableMock>>fuelAccept: aGeneralMapper [

	aGeneralMapper visitNotSerializable: self
]
