Extension {
	#name : #TClass
}

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
TClass>>renameSilently: aName [
	 [ self rename: aName] fuelValueWithoutNotifications
]
