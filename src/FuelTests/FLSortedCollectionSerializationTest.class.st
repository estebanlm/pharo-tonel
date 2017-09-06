"
SUnit tests for fuel serialization of sorted collections
"
Class {
	#name : #FLSortedCollectionSerializationTest,
	#superclass : #FLSerializationTest,
	#instVars : [
		'instanceVariableForTesting'
	],
	#classVars : [
		'ClassVariableForTesting'
	],
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:30'
}

{
	#category : #'sorted collections for testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest class>>sortedCollectionForTestingWithClassVariable. [
	^  SortedCollection sortBlock: [:a :b | 
		ClassVariableForTesting 
			ifTrue: [ a <= b ] 
			ifFalse: [ a >= b ] ]. 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest>>classVariableForTesting [
	
	^ ClassVariableForTesting
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest>>classVariableForTesting: anObject [
	
	ClassVariableForTesting := anObject 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest>>sortedBlockClosureWithInstanceVariable [
	^ SortedCollection
		sortBlock: [ :a :b | 
			instanceVariableForTesting
				ifTrue: [ a <= b ]
				ifFalse: [ a >= b ] ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest>>testSortedCollection [
	"Tests that a SortedCollection works fine after materialization. 
	Note: Equality can not be used to assert, since its behavior is this:
	| x y |
	x := SortedCollection sortBlock: [:a :b | a >= b ].
	y := SortedCollection sortBlock: [:a :b | a >= b ].
	self assert: x ~= y"

	| aSortBlock aSortedCollection materialized |
	aSortBlock := [:a :b | a >= b ].
	aSortedCollection := SortedCollection sortBlock: aSortBlock.

	materialized := self resultOfSerializeAndMaterialize: aSortedCollection.
	self assert: aSortedCollection sortBlock ~~ materialized sortBlock.

	materialized addAll: #(2 1 3).
	aSortedCollection addAll: #(2 1 3).	
	self assert: aSortedCollection asArray = materialized asArray.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest>>testSortedCollectionWithClassVariableChanges [
	"Tests serialization of a SortedCollection whose sortBlock has a reference to a class variable and its value is changed. See also FLBlockClosureSerializationTest >> testBlockClosureWithClassVariableChanges  and FLCompiledMethodSerializationTest >> testMethodChangingClassVariable"

	| aSortedCollection materialized mmethod index |
	ClassVariableForTesting := false.
	
	aSortedCollection := self class sortedCollectionForTestingWithClassVariable.
	materialized := self resultOfSerializeAndMaterialize: aSortedCollection.
	"the class variable ClassVariableForTesting should be false"
	
	mmethod := materialized sortBlock outerContext method.
	
	index := mmethod literals indexOf: (self class bindingOf: #ClassVariableForTesting).
	
	self deny: (mmethod literalAt: index) value.
	ClassVariableForTesting := true.
	"the class variable ClassVariableForTesting should be true"
	self assert: (mmethod literalAt: index) value.
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest>>testSortedCollectionWithClassVariableReference [
	"Tests serialization of a SortedCollection whose sortBlock has a reference to the outer context. 
	Note: Equality can not be used to assert, since its behavior is this:
	| x y |
	x := SortedCollection sortBlock: [:a :b | a >= b ].
	y := SortedCollection sortBlock: [:a :b | a >= b ].
	self assert: x ~= y"

	| aSortedCollection materialized |
	ClassVariableForTesting := false.
	
	aSortedCollection := self class sortedCollectionForTestingWithClassVariable.
	materialized := self resultOfSerializeAndMaterialize: aSortedCollection.
	ClassVariableForTesting := true.
	materialized addAll: #(2 3 1).
	aSortedCollection addAll: #(2 3 1).
	
	aSortedCollection sortBlock assertWellMaterializedInto:  materialized sortBlock in: self.
	self assert: aSortedCollection asArray = materialized asArray.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest>>testSortedCollectionWithInstanceVariableReference [
	"Tests serialization of a SortedCollection whose sortBlock has a reference to the outer context. 
	Note: Equality can not be used to assert, since its behavior is this:
	| x y |
	x := SortedCollection sortBlock: [:a :b | a >= b ].
	y := SortedCollection sortBlock: [:a :b | a >= b ].
	self assert: x ~= y"

	| aSortedCollection materialized |
	instanceVariableForTesting := false.
	aSortedCollection := self sortedBlockClosureWithInstanceVariable.
	
	materialized := self resultOfSerializeAndMaterialize: aSortedCollection.
	materialized addAll: #(2 3 1).
	aSortedCollection addAll: #(2 3 1).
	
	self assert: aSortedCollection asArray = materialized asArray.
	self assert: aSortedCollection asArray = #(3 2 1)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSortedCollectionSerializationTest>>testSortedCollectionWithInstanceVariableReferenceChange [
	"IMPORTANT: this test is to demonstrate a limitation.  Unfortunatly there is nothing we can do to solve this problem. The sortBlock was serialized with a method context with different receiver, different temps, etc.
	Tests serialization of a SortedCollection whose sortBlock has a reference to the outer context. 
	Note: Equality can not be used to assert, since its behavior is this:
	| x y |
	x := SortedCollection sortBlock: [:a :b | a >= b ].
	y := SortedCollection sortBlock: [:a :b | a >= b ].
	self assert: x ~= y"

	| aSortedCollection materialized |
	instanceVariableForTesting := false.
	aSortedCollection := self sortedBlockClosureWithInstanceVariable.

	materialized := self resultOfSerializeAndMaterialize: aSortedCollection.

	instanceVariableForTesting := true.
	materialized addAll: #(2 3 1).
	aSortedCollection addAll: #(2 3 1).

	"IMPORTANT: Unfortunatly there is nothing we can do to solve this problem. The sortBlock was serialized with a method context with different values."
	self deny: aSortedCollection asArray = materialized asArray.
]
