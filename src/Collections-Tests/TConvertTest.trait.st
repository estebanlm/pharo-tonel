"
A trait for test purposes
"
Trait {
	#name : #TConvertTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>assertNoDuplicates: aCollection whenConvertedTo: aClass  [
	| result |
	result := self collectionWithEqualElements asIdentitySet.
	self assert: (result class includesBehavior: IdentitySet).
	self collectionWithEqualElements do: [ :initial | self assert: (result occurrencesOf: initial) = 1 ]
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>assertNonDuplicatedContents: aCollection whenConvertedTo: aClass  [
	| result |
	result := aCollection perform: ('as' , aClass name) asSymbol.
	self assert: (result class includesBehavior: aClass).
	result do: 
		[ :each | 
		self assert: (aCollection occurrencesOf: each) = (result occurrencesOf: each) ].
	^ result
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>assertSameContents: aCollection whenConvertedTo: aClass  [
	| result |
	result := self assertNonDuplicatedContents: aCollection whenConvertedTo: aClass.
	self assert: result size = aCollection size
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>collectionWithoutEqualElements [
" return a collection without equal elements"
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>integerCollectionWithoutEqualElements [
" return a collection of integer without equal elements"
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>test0FixtureTConvertTest [
	"a collection of number without equal elements:"

	| res |
	self collectionWithoutEqualElements.
	res := true.
	self collectionWithoutEqualElements
		detect: [ :each | (self collectionWithoutEqualElements occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self assert: res = false
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>testAsArray [
	"self debug: #testAsArray3"
	self 
		assertSameContents: self collectionWithoutEqualElements
		whenConvertedTo: Array
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>testAsBag [

	self assertSameContents: self collectionWithoutEqualElements whenConvertedTo: Bag
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>testAsByteArray [
	| res |
	self integerCollectionWithoutEqualElements.
	self integerCollectionWithoutEqualElements do: [ :each | self assert: each class = SmallInteger ].
	res := true.
	self integerCollectionWithoutEqualElements
		detect: [ :each | (self integerCollectionWithoutEqualElements occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self assert: res = false.
	self assertSameContents: self integerCollectionWithoutEqualElements whenConvertedTo: ByteArray
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>testAsIdentitySet [
	"test with a collection without equal elements :"
	self 
		assertSameContents: self collectionWithoutEqualElements
		whenConvertedTo: IdentitySet.

]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>testAsOrderedCollection [
	
	self assertSameContents: self collectionWithoutEqualElements whenConvertedTo: OrderedCollection
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertTest>>testAsSet [
	| |
	"test with a collection without equal elements :"
	self assertSameContents: self collectionWithoutEqualElements whenConvertedTo: Set.
	
]
