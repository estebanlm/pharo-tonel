Extension {
	#name : #Float
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Float>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitHookPrimitive: self
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Float class>>materializeFrom: aDecoder [

	^ (self new: 2)
		at: 1 put: aDecoder nextEncodedUint32;
		at: 2 put: aDecoder nextEncodedUint32;
		yourself.

]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Float>>serializeOn: anEncoder [

	anEncoder 
		encodeUint32: (self at: 1);
		encodeUint32: (self at: 2).
]
