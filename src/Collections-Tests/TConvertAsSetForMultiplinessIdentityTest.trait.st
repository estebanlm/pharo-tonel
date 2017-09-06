"
A trait for test purposes
"
Trait {
	#name : #TConvertAsSetForMultiplinessIdentityTest,
	#traits : 'TConvertAsSetForMultiplinessTest',
	#classTraits : 'TConvertAsSetForMultiplinessTest classTrait',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>collectionWithCopy [
	"return a collection of type 'self collectionWIithoutEqualsElements class' containing no elements equals ( with identity equality)
	but  2 elements only equals with classic equality"
	| result collection |
	collection := OrderedCollection withAll: self elementsCopyNonIdenticalWithoutEqualElements.
	collection add: collection first copy.
	result := self elementsCopyNonIdenticalWithoutEqualElements class withAll: collection.
	^ result
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>collectionWithIdentical [
	"return a collection of type : 'self collectionWIithoutEqualsElements class containing two elements equals ( with identity equality)"
	| result collection anElement |
	collection := OrderedCollection withAll: self elementsCopyNonIdenticalWithoutEqualElements.
	anElement := collection first.
	collection add: anElement.
	result := self elementsCopyNonIdenticalWithoutEqualElements class withAll: collection.
	^ result
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>elementsCopyNonIdenticalWithoutEqualElements [
	" return a collection that does niot incllude equal elements ( classic equality )
	all elements included are elements for which copy is not identical to the element  "
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>test0FixtureAsSetForIdentityMultiplinessTest [
	"a collection (of elements for which copy is not identical ) without equal elements:"

	| anElement res |
	self elementsCopyNonIdenticalWithoutEqualElements.
	anElement := self elementsCopyNonIdenticalWithoutEqualElements anyOne.
	self deny: anElement copy == anElement.
	res := true.
	self elementsCopyNonIdenticalWithoutEqualElements
		detect: [ :each | (self elementsCopyNonIdenticalWithoutEqualElements occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self assert: res = false
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>test0FixtureTConvertAsSetForMultiplinessTest [
	"a collection  with equal elements:"

	| res |
	self withEqualElements.
	res := true.
	self withEqualElements detect: [ :each | (self withEqualElements occurrencesOf: each) > 1 ] ifNone: [ res := false ].
	self assert: res = true
]

{
	#category : #'tests - as set tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>testAsIdentitySetWithEqualsElements [
	| result collection |
	collection := self withEqualElements .
	result := collection asIdentitySet.
	collection do: [ :each | self assert: (result occurrencesOf: each) = 1 ].
	self assert: result class = IdentitySet.
]

{
	#category : #'tests - as identity set',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>testAsIdentitySetWithIdentityEqualsElements [
	| result |
	result := self collectionWithIdentical asIdentitySet.
	" Only one element should have been removed as two elements are equals with Identity equality"
	self assert: result size = (self collectionWithIdentical size - 1).
	self collectionWithIdentical do: 
		[ :each | 
		(self collectionWithIdentical occurrencesOf: each) > 1 
			ifTrue: 
				[ "the two elements equals only with classic equality shouldn't 'have been removed"
				self assert: (result asOrderedCollection occurrencesOf: each) = 1
				" the other elements are still here" ]
			ifFalse: [ self assert: (result asOrderedCollection occurrencesOf: each) = 1 ] ].
	self assert: result class = IdentitySet
]

{
	#category : #'tests - as identity set',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>testAsIdentitySetWithoutIdentityEqualsElements [
	| result collection |
	collection := self collectionWithCopy.
	result := collection asIdentitySet.
	" no elements should have been removed as no elements are equels with Identity equality"
	self assert: result size = collection size.
	collection do: 
		[ :each | 
		(collection occurrencesOf: each) = (result asOrderedCollection occurrencesOf: each) ].
	self assert: result class = IdentitySet
]

{
	#category : #'tests - as set tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>testAsSetWithEqualsElements [
	| result |
	result := self withEqualElements asSet.
	self withEqualElements do: [ :each | self assert: (result occurrencesOf: each) = 1 ].
	self assert: result class = Set
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessIdentityTest>>withEqualElements [
	" return a collection  including equal elements (classic equality)"
	^ self explicitRequirement
]
