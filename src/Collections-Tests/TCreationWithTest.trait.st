"
A trait for test purposes
"
Trait {
	#name : #TCreationWithTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>collectionClass  [
	
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>collectionMoreThan5Elements [
" return a collection including at least 5 elements"
	
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>test0FixtureCreationWithTest [
	self collectionMoreThan5Elements.
	self assert: self collectionMoreThan5Elements size >= 5
]

{
	#category : #'test - creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>testOfSize [
	"self debug: #testOfSize"
	
	| aCol |
	aCol := self collectionClass ofSize: 3.
	self assert: (aCol size = 3).

]

{
	#category : #'test - creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>testWith [
	"self debug: #testWith"
	
	| aCol anElement |
	anElement := self collectionMoreThan5Elements anyOne.
	aCol := self collectionClass with: anElement.
	self assert: (aCol includes: anElement).
]

{
	#category : #'test - creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>testWithAll [
	"self debug: #testWithAll"
	
	| aCol collection |
	collection := self collectionMoreThan5Elements asOrderedCollection .
	aCol := self collectionClass withAll: collection  .
	
	collection do: [ :each | self assert: (aCol occurrencesOf: each ) = ( collection occurrencesOf: each ) ].
	
	self assert: (aCol size = collection size ).
]

{
	#category : #'test - creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>testWithWith [
	"self debug: #testWithWith"
	
	| aCol collection element1 element2 |
	collection := self collectionMoreThan5Elements asOrderedCollection copyFrom: 1 to: 2  .
	element1 := collection at: 1.
	element2 := collection at:2.
	
	aCol := self collectionClass with: element1  with: element2 .
	self assert: (aCol occurrencesOf: element1 ) = ( collection occurrencesOf: element1).
	self assert: (aCol occurrencesOf: element2 ) = ( collection occurrencesOf: element2).
	
	
]

{
	#category : #'test - creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>testWithWithWith [
	"self debug: #testWithWithWith"
	
	| aCol collection |
	collection := self collectionMoreThan5Elements asOrderedCollection copyFrom:1 to: 3 .
	aCol := self collectionClass with: (collection at:1) with: ( collection at:2 ) with: ( collection at: 3).

	1 to: 3 do: [ :i | self assert: ( aCol occurrencesOf: ( collection at: i ) ) = ( collection occurrencesOf: ( collection at: i ) ) ].
]

{
	#category : #'test - creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>testWithWithWithWith [
	"self debug: #testWithWithWithWith"
	
	| aCol collection |
	collection := self collectionMoreThan5Elements asOrderedCollection copyFrom: 1 to: 4.
	aCol := self collectionClass with: (collection at:1) with: ( collection at:2 ) with: ( collection at: 3) with: ( collection at: 4).

	1 to: 3 do: [ :i | self assert: ( aCol occurrencesOf: ( collection at: i ) ) = ( collection occurrencesOf: ( collection at: i ) ) ].
]

{
	#category : #'test - creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCreationWithTest>>testWithWithWithWithWith [
	"self debug: #testWithWithWithWithWith"
	
	| aCol collection |
	collection := self collectionMoreThan5Elements asOrderedCollection copyFrom: 1 to: 5 .
	aCol := self collectionClass with: (collection at:1) with: ( collection at:2 ) with: ( collection at: 3) with: (collection at: 4 ) with: ( collection at: 5 ).

	1 to: 3 do: [ :i | self assert: ( aCol occurrencesOf: ( collection at: i ) ) = ( collection occurrencesOf: ( collection at: i ) ) ].
]
