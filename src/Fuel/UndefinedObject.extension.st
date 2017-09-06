Extension {
	#name : #UndefinedObject
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
UndefinedObject>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitHookPrimitive: self
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
UndefinedObject class>>materializeFrom: aDecoder [
	"Answer my unique instance"

	^ nil
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
UndefinedObject>>serializeOn: anEncoder [
	"Do nothing"
]
