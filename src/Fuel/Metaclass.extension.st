Extension {
	#name : #Metaclass
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Metaclass>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitMetaclass: self

]
