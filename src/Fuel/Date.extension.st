Extension {
	#name : #Date
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Date>>fuelAccept: aGeneralMapper [

	^ aGeneralMapper visitHookPrimitive: self

]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Date class>>materializeFrom: aDecoder [
	^ self 
		starting: (DateAndTime materializeFrom: aDecoder) midnight 
		duration: (Duration days: 1)
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Date>>serializeOn: anEncoder [
	start serializeOn: anEncoder
]
