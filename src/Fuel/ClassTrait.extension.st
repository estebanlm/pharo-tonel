Extension {
	#name : #ClassTrait
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
ClassTrait>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitClassTrait: self

]
