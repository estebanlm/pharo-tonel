"
A trait for test purposes
"
Trait {
	#name : #TSetArithmetic,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:35'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>collection [

	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>collectionClass [
" return the class to be used to create instances of the class tested"
	^ self explicitRequirement
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>containsAll: union of: one andOf: another [
			
	self assert: (one allSatisfy: [:each | union includes: each]).
	self assert: (another allSatisfy: [:each | union includes: each])
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>nonEmpty [

	^ self explicitRequirement
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>numberOfSimilarElementsInIntersection [
	^ self collection occurrencesOf: self anotherElementOrAssociationIn
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>test0FixtureSetAritmeticTest [
	self collection.
	self deny: self collection isEmpty.
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self anotherElementOrAssociationNotIn.
	self collection isDictionary
		ifTrue: [ self deny: (self collection associations includes: self anotherElementOrAssociationNotIn key) ]
		ifFalse: [ self deny: (self collection includes: self anotherElementOrAssociationNotIn) ].
	self collectionClass
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testDifference [
	"Answer the set theoretic difference of two collections."
	"self debug: #testDifference"
	
	| difference |
	self assert: (self collectionWithoutEqualElements difference: self collectionWithoutEqualElements) isEmpty.
	self assert: (self empty difference: self collectionWithoutEqualElements) isEmpty.
	difference := (self collectionWithoutEqualElements difference: self empty).
	self assert: difference size = self collectionWithoutEqualElements	 size.
	self collectionWithoutEqualElements do: [ :each |
		self assert: (difference includes: each)].

]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testDifferenceWithNonNullIntersection [
	"Answer the set theoretic difference of two collections."
	"self debug: #testDifferenceWithNonNullIntersection"
	"	#(1 2 3) difference: #(2 4) 
	->  #(1 3)"
	| res overlapping |
	overlapping := self collectionClass 
		with: self anotherElementOrAssociationNotIn
		with: self anotherElementOrAssociationIn.
	res := self collection difference: overlapping.
	self deny: (res includes: self anotherElementOrAssociationIn).
	overlapping do: [ :each | self deny: (res includes: each) ]
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testDifferenceWithSeparateCollection [
	"Answer the set theoretic difference of two collections."
	"self debug: #testDifferenceWithSeparateCollection"
	| res separateCol |
	
	separateCol := self collectionClass with: self anotherElementOrAssociationNotIn.
	res := self collectionWithoutEqualElements difference: separateCol.
	
	self deny: (res includes: self anotherElementOrAssociationNotIn).
	self assert: res size equals: self collectionWithoutEqualElements size.
	
	self collectionWithoutEqualElements do: [ :each|
		self assert: (res includes: each)].
	
	res := separateCol difference: self collection.
	self deny: (res includes: self collection anyOne).
	self assert: res equals: separateCol
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testIntersectionBasic [
	"self debug: #testIntersectionBasic"
	| inter |
	inter := self collection intersection: (self collectionClass with: self anotherElementOrAssociationIn).
	self deny: inter isEmpty.
	self assert: (inter includes: self anotherElementOrAssociationIn value)
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testIntersectionEmpty [
	"self debug: #testIntersectionEmpty"
	
	| inter |
	inter := self empty intersection: self empty.
	self assert: inter isEmpty. 
	inter := self empty intersection: self collection .
	self assert: inter =  self empty.
	
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testIntersectionItself [
	"self debug: #testIntersectionItself"
	
	| result |
	result :=  (self collectionWithoutEqualElements intersection: self collectionWithoutEqualElements).
	self assert: result size  = self collectionWithoutEqualElements size.
	self collectionWithoutEqualElements do: [ :each|
		self assert: (result includes: each) ].
	
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testIntersectionTwoSimilarElementsInIntersection [
	"self debug: #testIntersectionBasic"
	| inter |
	inter := self collection intersection: (self collectionClass with: self anotherElementOrAssociationIn).
	self assert: (self collection occurrencesOf: self anotherElementOrAssociationIn) = self numberOfSimilarElementsInIntersection.
	self assert: (inter includes: self anotherElementOrAssociationIn value)
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testUnion [
	"self debug: #testUnionOfEmpties"
	
	| union |
	union := self empty union: self nonEmpty.
	self containsAll: union of: self empty andOf: self nonEmpty.
	union := self nonEmpty union: self empty.
	self containsAll: union of: self empty andOf: self nonEmpty.
	union := self collection union: self nonEmpty.
	self containsAll: union of: self collection andOf: self nonEmpty.
]

{
	#category : #'tests - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSetArithmetic>>testUnionOfEmpties [
	"self debug: #testUnionOfEmpties"
	
	self assert:  (self empty union: self empty) isEmpty.
	
	
]
