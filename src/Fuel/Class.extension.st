Extension {
	#name : #Class
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Class>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitClass: self
]
