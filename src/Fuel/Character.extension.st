Extension {
	#name : #Character
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Character>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitHookPrimitive: self
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Character>>largeIdentityHash [

	^ self identityHash
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Character class>>materializeFrom: aDecoder [

	^self value: aDecoder nextEncodedUint32
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Character>>serializeOn: anEncoder [

	anEncoder encodeUint32: self asInteger
]
