Extension {
	#name : #Class
}

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
Class>>renameSilently: aName [
	 [ self rename: aName] fuelValueWithoutNotifications
]
