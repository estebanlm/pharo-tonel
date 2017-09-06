Extension {
	#name : #ByteSymbol
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
ByteSymbol>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitHookPrimitive: self
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
ByteSymbol class>>materializeFrom: aDecoder [

	^ aDecoder nextEncodedString asSymbol
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
ByteSymbol>>serializeOn: anEncoder [

	anEncoder encodeString: self
]
