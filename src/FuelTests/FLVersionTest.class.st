"
SUnit tests for fuel versioning
"
Class {
	#name : #FLVersionTest,
	#superclass : #FLSerializationTest,
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:29'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLVersionTest>>testBadVersion [

	serializer version: 2.
	materializer version: 1.
	self
		should: [ self resultOfSerializeAndMaterialize: 'content' ]
		raise: FLBadVersion
		whoseDescriptionIncludes: '2'
		description: 'The materializer should raise an error when version differs of the expected one.'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLVersionTest>>testSameVersion [

	serializer version: 1.
	materializer version: 1.
	self assertSerializationEqualityOf: 'content'
]
