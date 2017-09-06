"

"
Class {
	#name : #EpAsEpiceaRingDefinitionTest,
	#superclass : #TestCase,
	#category : #EpiceaTests-Model,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpAsEpiceaRingDefinitionTest>>definitions [
	"FIX: it should not have this external dependency to Fuel code entities."

	^ {	(FLSerializer >> #serialize:on:).
		(Object >> #fuelAccept:).
		FLSerializer.
		FLSerializer class. 
		FLTGlobalClassOrTraitSerializationTest.
		FLTGlobalClassOrTraitSerializationTest classTrait.
		} collect: #asEpiceaRingDefinition
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpAsEpiceaRingDefinitionTest>>testPackageIsString [

	self definitions do: [ :each |
		self assert: each package isString.
		self assert: each package isNotEmpty ]
]
