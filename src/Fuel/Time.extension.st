Extension {
	#name : #Time
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Time>>fuelAccept: aGeneralMapper [

	^ aGeneralMapper visitHookPrimitive: self

]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Time class>>materializeFrom: aDecoder [
	
	^ self 
		seconds: aDecoder nextEncodedUint24
		nanoSeconds: aDecoder nextEncodedUint32
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Time>>serializeOn: anEncoder [

	anEncoder 
		encodeUint24: self asSeconds;
		encodeUint32: self nanoSecond.
		
]
