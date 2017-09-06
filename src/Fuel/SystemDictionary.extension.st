Extension {
	#name : #SystemDictionary
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
SystemDictionary>>fuelAccept: aGeneralMapper [
	"serialize all instances except for <Smalltalk globals>"
	^ self == Smalltalk globals 
		ifFalse: [ super fuelAccept: aGeneralMapper ]
		ifTrue: [ aGeneralMapper visitHookPrimitive: self ]
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
SystemDictionary class>>materializeFrom: aDecoder [
	"Answer my well-known instance"

	^ Smalltalk globals
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
SystemDictionary>>serializeOn: anEncoder [
	"Do nothing"
]
