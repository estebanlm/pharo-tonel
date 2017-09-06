Extension {
	#name : #Trait
}

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
Trait>>renameSilently: aName [
	 [ self rename: aName] fuelValueWithoutNotifications
]
