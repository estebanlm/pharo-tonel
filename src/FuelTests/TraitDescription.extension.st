Extension {
	#name : #TraitDescription
}

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
TraitDescription>>duringTestCompileSilently: code [
	^ self 
		duringTestCompileSilently: code 
		storeSource: true
]

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
TraitDescription>>duringTestCompileSilently: code classified: aCategory [
	^ self 
		duringTestCompileSilently: code
		storeSource: true
		classified: aCategory
]

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
TraitDescription>>duringTestCompileSilently: code storeSource: storeSource [
	^ self
		duringTestCompileSilently: code
		storeSource: storeSource
		classified: ''
]

{
	#category : #'*FuelTests',
	#timestamp : ' 8/31/2017 05:26:30'
}
TraitDescription>>duringTestCompileSilently: code storeSource: storeSource classified: aCategory [
	^ FLPlatform current 
		useAuthor: 'TestsAuthor'
		during: [ [
			self 
				compile: code
				classified: (aCategory ifNil: [ '' ])
				withStamp: nil 
				notifying: nil 
				logSource: storeSource ] fuelValueWithoutNotifications ]
]
