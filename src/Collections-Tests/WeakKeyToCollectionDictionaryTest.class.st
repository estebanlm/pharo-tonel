"
SUnit tests for weak key to collection dictionaries 
"
Class {
	#name : #WeakKeyToCollectionDictionaryTest,
	#superclass : #WeakIdentityKeyDictionaryTest,
	#category : #Collections-Tests-Weak,
	#timestamp : 'TorstenBergmann 2/20/2014 15:27'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyToCollectionDictionaryTest>>classToBeTested  [
 ^ WeakKeyToCollectionDictionary
]

{
	#category : #'errors - those methods should be tested with collection keys',
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyToCollectionDictionaryTest>>testKeysAndValuesRemove [
	" should be tested with collection keys"
	
	"| oldSize collection keyIn |
	
	
	collection := self nonEmptyDict .
	oldSize := collection  size.
	keyIn := collection keys anyOne.
	
	collection  keysAndValuesRemove: [:key :value | key == self keyNotInNonEmptyDict ].
	self assert: (collection  size = (oldSize )).
	
	collection  keysAndValuesRemove: [:key :value | key == keyIn ].
	self assert: (collection  size = (oldSize - 1)).
	self should: [ collection at: keyIn  ] raise: Error."
]

{
	#category : #'errors - those methods should be tested with collection keys',
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyToCollectionDictionaryTest>>testRemoveKey [
	"self debug: #testRemoveKey"

"	| collection oldSize keyIn |
	collection := self nonEmptyDict .
	oldSize := collection size.
	keyIn := collection  keys anyOne.
	
	collection removeKey: keyIn .
	self assert: (collection  size = (oldSize - 1)).
	self should: [ (collection  at: keyIn )] raise: Error.
	
	self should: [collection removeKey: self keyNotInNonEmptyDict ] raise: Error"
]

{
	#category : #'errors - those methods should be tested with collection keys',
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakKeyToCollectionDictionaryTest>>testRemoveKeyIfAbsent [
	
	"| collection oldSize keyIn value result |
	collection := self nonEmptyDict .
	oldSize := collection size.
	keyIn := collection  keys anyOne.
	value := collection at: keyIn .
	
	result := collection removeKey: keyIn ifAbsent: [888].
	
	self assert: result = value.
	self assert: (collection  size = (oldSize - 1)).
	self should: [ (collection  at: keyIn )] raise: Error.
	
	self assert: (collection removeKey: self keyNotInNonEmptyDict ifAbsent: [888] ) = 888."
]
