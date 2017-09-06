"
SUnit tests for fuel serializations, here signatures
"
Class {
	#name : #FLSignatureTest,
	#superclass : #FLSerializationTest,
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:31'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSignatureTest>>testBadSignature [

	serializer signature: 'FUELx'.
	materializer signature: 'FUELy'.
	self
		should: [ self resultOfSerializeAndMaterialize: 'content' ]
		raise: FLBadSignature
		whoseDescriptionIncludes: 'FUELy'
		description: 'The materializer should raise an error when signature differs of the expected one.'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSignatureTest>>testSameSignature [

	serializer signature: 'FUELx'.
	materializer signature: 'FUELx'.
	self assertSerializationEqualityOf: 'content'
]
