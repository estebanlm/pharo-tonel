Extension {
	#name : #ByteArray
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
ByteArray>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitBytesObject: self
]
