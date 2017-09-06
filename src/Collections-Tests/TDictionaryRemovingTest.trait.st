"
A trait for test purposes
"
Trait {
	#name : #TDictionaryRemovingTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>emptyDict [
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>keyNotInNonEmptyDict [
" return a key not included in nonEmptyDict"
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>newEmptyDict [
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>nonEmptyDict [
	self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>test0FixtureDictionaryRemovingTest [
	self nonEmptyDict.
	self deny: self nonEmptyDict isEmpty.
	self keyNotInNonEmptyDict.
	self deny: (self nonEmptyDict keys includes: self keyNotInNonEmptyDict)
]

{
	#category : #'test - removing',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>testKeysAndValuesRemove [
	| oldSize collection keyIn |
	
	collection := self nonEmptyDict .
	oldSize := collection  size.
	keyIn := collection keys anyOne.
	
	collection  keysAndValuesRemove: [:key :value | key == self keyNotInNonEmptyDict ].
	self assert: (collection  size = (oldSize )).
	
	collection  keysAndValuesRemove: [:key :value | key == keyIn ].
	self assert: (collection  size = (oldSize - 1)).
	self should: [ collection at: keyIn  ] raise: Error.
]

{
	#category : #'test - removing',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>testRemove [

	self should: [self nonEmptyDict remove: nil] raise: Error.
	self should: [self nonEmptyDict remove: nil ifAbsent: ['What ever here']] raise: Error.
]

{
	#category : #'test - removing',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>testRemoveKey [
	"self debug: #testRemoveKey"

	| collection oldSize keyIn |
	collection := self nonEmptyDict .
	oldSize := collection size.
	keyIn := collection  keys anyOne.
	
	collection removeKey: keyIn .
	self assert: (collection  size = (oldSize - 1)).
	self should: [ (collection  at: keyIn )] raise: Error.
	
	self should: [collection removeKey: self keyNotInNonEmptyDict ] raise: Error
]

{
	#category : #'test - removing',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryRemovingTest>>testRemoveKeyIfAbsent [
	
	| collection oldSize keyIn value result |
	collection := self nonEmptyDict .
	oldSize := collection size.
	keyIn := collection  keys anyOne.
	value := collection at: keyIn .
	
	result := collection removeKey: keyIn ifAbsent: [888].
	
	self assert: result = value.
	self assert: (collection  size = (oldSize - 1)).
	self should: [ (collection  at: keyIn )] raise: Error.
	
	self assert: (collection removeKey: self keyNotInNonEmptyDict ifAbsent: [888] ) = 888.
]
