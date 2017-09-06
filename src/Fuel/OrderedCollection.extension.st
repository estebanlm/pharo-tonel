Extension {
	#name : #OrderedCollection
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
OrderedCollection>>fuelAccept: aGeneralMapper [
	"Since we have subclasses of OrderedCollection that behave differently, we cannot use the visitSimpleCollection: for all of them."
	^ (self class == OrderedCollection ) 
		ifTrue: [ aGeneralMapper visitSimpleCollection: self ]
		ifFalse: [ super fuelAccept: aGeneralMapper ] 
	
]
