Extension {
	#name : #ByteString
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
ByteString>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitHookPrimitive: self
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
ByteString class>>materializeFrom: aDecoder [

	^ aDecoder nextEncodedString
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
ByteString>>serializeOn: anEncoder [

	anEncoder encodeString: self
]
