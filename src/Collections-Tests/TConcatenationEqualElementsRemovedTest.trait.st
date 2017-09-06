"
A trait for test purposes
"
Trait {
	#name : #TConcatenationEqualElementsRemovedTest,
	#traits : 'TConcatenationTest',
	#classTraits : 'TConcatenationTest classTrait',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConcatenationEqualElementsRemovedTest>>empty [
	self explicitRequirement.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConcatenationEqualElementsRemovedTest>>firstCollection [
" return a collection that will be the first part of the concatenation"
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConcatenationEqualElementsRemovedTest>>secondCollection [
" return a collection that will be the second part of the concatenation"
	self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConcatenationEqualElementsRemovedTest>>test0FixtureConcatenationTest [
	self firstCollection.
	self deny: self firstCollection isEmpty.
	self firstCollection.
	self deny: self firstCollection isEmpty.
	self empty.
	self assert: self empty isEmpty
]

{
	#category : #'tests - concatenation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConcatenationEqualElementsRemovedTest>>testConcatenation [

| collection1 collection2 result |
collection1 := self firstCollection .
collection2 := self secondCollection .
result := collection1 , collection2.

collection1 do:[ :each | self assert: (result includes: each)].
collection2 do:[ :each | self assert: (result includes: each)].

]

{
	#category : #'tests - concatenation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConcatenationEqualElementsRemovedTest>>testConcatenationWithDuplicate [


| collection1 collection2 result |
collection1 := self firstCollection .
collection2 := self firstCollection  .
result := collection1 , collection2.

collection1 do:[ :each | self assert: (result includes: each)].
self assert: result size = collection1 size.
]

{
	#category : #'tests - concatenation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConcatenationEqualElementsRemovedTest>>testConcatenationWithEmpty [
	| result |
	result := self firstCollection , self empty.
	self assert: result = self firstCollection
]
