Extension {
	#name : #TraitBehavior
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
TraitBehavior>>fuelIgnoredInstanceVariableNames [
	"Indicates which variables have to be ignored during serialization."

	^#()
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
TraitBehavior>>fuelNew [
	"Answer an instance of mine in which serialized references will be injected."

	^ self basicNew
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
TraitBehavior>>fuelNew: sizeRequested  [
	"Answer an instance of mine in which serialized references will be injected."

	^ self basicNew: sizeRequested
]
