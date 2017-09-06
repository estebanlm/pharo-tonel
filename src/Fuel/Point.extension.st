Extension {
	#name : #Point
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Point>>fuelAccept: aGeneralMapper [

	^ aGeneralMapper visitPoint: self

]
