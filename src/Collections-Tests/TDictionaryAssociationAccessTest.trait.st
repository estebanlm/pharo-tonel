"
A trait for test purposes
"
Trait {
	#name : #TDictionaryAssociationAccessTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryAssociationAccessTest>>keyNotIn [
" return a key not included in nonEmpty"
self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryAssociationAccessTest>>nonEmpty [
^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryAssociationAccessTest>>test0FixtureDictionaryAssocitionAccess [
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self keyNotIn.
	self deny: (self nonEmpty keys includes: self keyNotIn)
]

{
	#category : #'tests - dictionary assocition access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryAssociationAccessTest>>testAssociationAt [

	| collection keyIn result |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.

	result := collection associationAt: keyIn. 

	self assert: (result key) = keyIn.
	self assert: (result value ) = (collection at: keyIn ).
]

{
	#category : #'tests - dictionary assocition access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryAssociationAccessTest>>testAssociationAtError [

	| collection nonExistantKey |
	collection := self nonEmpty.
	nonExistantKey := self keyNotIn .

	self should: [collection associationAt: nonExistantKey] raise: Error. 


]

{
	#category : #'tests - dictionary assocition access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryAssociationAccessTest>>testAssociationAtIfAbsent [

	| collection keyIn result |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.

	result := collection associationAt: keyIn ifAbsent: [888]. 

	self assert: (result key) = keyIn.
	self assert: (result value ) = (collection at: keyIn ).

	self assert: (collection associationAt: self keyNotIn  ifAbsent: [888] ) = 888
]

{
	#category : #'tests - dictionary assocition access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryAssociationAccessTest>>testAssociationAtIfPresent [

	| collection keyIn result |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.

	result := collection associationAt: keyIn ifPresent: [:assoc | {#present. assoc}].
	self
		assert: result isArray;
		assert: result size = 2;
		assert: result first = #present;
		assert: result second key = keyIn;
		assert: result second value = (collection at: keyIn).

	"test that cull: is used to support zero-arg blocks"
	result := collection associationAt: keyIn ifPresent: [#present].
	self assert: result = #present.

	result := collection associationAt: self keyNotIn ifPresent: [:assoc | {#present. assoc}].
	self assert: result isNil.
]
