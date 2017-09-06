Extension {
	#name : #Trait
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Trait>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitTrait: self
]
