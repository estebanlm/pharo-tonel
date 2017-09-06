"
SUnit tests for basic in memory serialization
"
Class {
	#name : #FLInMemoryBasicSerializationTest,
	#superclass : #FLBasicSerializationTest,
	#instVars : [
		'byteArray'
	],
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:25'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLInMemoryBasicSerializationTest class>>shouldInheritSelectors  [
	^ true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLInMemoryBasicSerializationTest>>materialization [

	self error: 'Disabled, instead use #materialized.'

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLInMemoryBasicSerializationTest>>materialized [

	^ FLMaterializer materializeFromByteArray: byteArray.

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLInMemoryBasicSerializationTest>>serialize: anObject [

	byteArray := FLSerializer serializeToByteArray: anObject
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLInMemoryBasicSerializationTest>>testConsiderCustomGlobal [
	"Since FLSerializer class >> serializeToByteArray: does not allow customizing serialization, this test is disabled."
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLInMemoryBasicSerializationTest>>testStringGlobalsAndClosure [

	| materialized |
	materialized := self resultOfSerializeAndMaterialize:  (Array 
			with: 'a string' 
			with: Transcript
			with: [ Transcript show: 'a string' ]).
	self assert: materialized first = 'a string'.
	self assert: materialized second == Transcript
]
