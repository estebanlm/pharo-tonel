"
SUnit tests for fuel serialization of global sends
"
Class {
	#name : #FLGlobalSendSerializationTest,
	#superclass : #FLSerializationTest,
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:28'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendSerializationTest>>testBasic [

	| result |
	self deny: FLGlobalSendMock newInstanceToSerialize = FLGlobalSendMock newInstanceToMaterialize.

	result := self resultOfSerializeAndMaterialize: FLGlobalSendMock newInstanceToSerialize.
	self assert: FLGlobalSendMock newInstanceToMaterialize = result.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendSerializationTest>>testGlobalNotFound [

	self should: [ self resultOfSerializeAndMaterialize: FLGlobalSendNotPresentMock new ]
		raise: FLGlobalNotFound
		whoseDescriptionIncludes: #FLKeyNotPresentInSmalltalks 
		description: 'Should raise an error when global name is not present in Smalltalks globals.' 
	

]
