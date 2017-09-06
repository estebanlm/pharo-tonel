"
A trait for test purposes
"
Trait {
	#name : #TConvertAsSetForMultiplinessTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessTest>>test0FixtureTConvertAsSetForMultiplinessTest [
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
TConvertAsSetForMultiplinessTest>>testAsIdentitySetWithEqualsElements [
	| result collection |
	collection := self withEqualElements .
	result := collection asIdentitySet.
	collection do: [ :each | self assert: (result occurrencesOf: each) = 1 ].
	self assert: result class = IdentitySet.
]

{
	#category : #'tests - as set tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessTest>>testAsSetWithEqualsElements [
	| result |
	result := self withEqualElements asSet.
	self withEqualElements do: [ :each | self assert: (result occurrencesOf: each) = 1 ].
	self assert: result class = Set
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TConvertAsSetForMultiplinessTest>>withEqualElements [
	" return a collection  including equal elements (classic equality)"
	^ self explicitRequirement
]
