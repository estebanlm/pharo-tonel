"
A trait for test purposes
"
Trait {
	#name : #TRemoveTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:35'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>elementNotIn [
" return an element not included in nonEmptyWithoutEqualElements"
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>empty [
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>nonEmptyWithoutEqualElements [
" return a collection without equal elements "
	self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>test0FixtureTRemoveTest [
	| duplicate |
	self empty.
	self nonEmptyWithoutEqualElements.
	self deny: self nonEmptyWithoutEqualElements isEmpty.
	duplicate := true.
	self nonEmptyWithoutEqualElements
		detect: [ :each | (self nonEmptyWithoutEqualElements occurrencesOf: each) > 1 ]
		ifNone: [ duplicate := false ].
	self assert: duplicate = false.
	self elementNotIn.
	self assert: self empty isEmpty.
	self deny: self nonEmptyWithoutEqualElements isEmpty.
	self deny: (self nonEmptyWithoutEqualElements includes: self elementNotIn)
]

{
	#category : #'tests - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>testRemoveAll [
	"self debug: #testRemoveElementThatExists"
	| el aSubCollection collection res |
	collection := self nonEmptyWithoutEqualElements.
	el := collection anyOne.
	aSubCollection := collection copyWithout: el.
	res := collection removeAll: aSubCollection.
	self assert: collection size = 1.
	self nonEmptyWithoutEqualElements do: [ :each | self assert: each = el ]
]

{
	#category : #'tests - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>testRemoveAllError [
	"self debug: #testRemoveElementThatExists"
	| el aSubCollection |
	el := self elementNotIn.
	aSubCollection := self nonEmptyWithoutEqualElements copyWith: el.
	self 
		should: [ | res | res := self nonEmptyWithoutEqualElements removeAll: aSubCollection ]
		raise: Error
]

{
	#category : #'tests - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>testRemoveAllFoundIn [
	"self debug: #testRemoveElementThatExists"
	| el aSubCollection res |
	el := self nonEmptyWithoutEqualElements anyOne.
	aSubCollection := (self nonEmptyWithoutEqualElements copyWithout: el) copyWith: self elementNotIn.
	res := self nonEmptyWithoutEqualElements removeAllFoundIn: aSubCollection.
	self assert: self nonEmptyWithoutEqualElements size = 1.
	self nonEmptyWithoutEqualElements do: [ :each | self assert: each = el ]
]

{
	#category : #'tests - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>testRemoveAllSuchThat [
	"self debug: #testRemoveElementThatExists"
	| el aSubCollection |
	el := self nonEmptyWithoutEqualElements anyOne.
	aSubCollection := self nonEmptyWithoutEqualElements copyWithout: el.
	self nonEmptyWithoutEqualElements removeAllSuchThat: [ :each | aSubCollection includes: each ].
	self assert: self nonEmptyWithoutEqualElements size = 1.
	self nonEmptyWithoutEqualElements do: [ :each | self assert: each = el ]
]

{
	#category : #'tests - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>testRemoveElementFromEmpty [
	"self debug: #testRemoveElementFromEmpty"
	self 
		should: [ self empty remove: self nonEmptyWithoutEqualElements anyOne ]
		raise: Error
]

{
	#category : #'tests - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>testRemoveElementReallyRemovesElement [
	"self debug: #testRemoveElementReallyRemovesElement"
	| size |
	size := self nonEmptyWithoutEqualElements size.
	self nonEmptyWithoutEqualElements remove: self nonEmptyWithoutEqualElements anyOne.
	self assert: size - 1 = self nonEmptyWithoutEqualElements size
]

{
	#category : #'tests - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>testRemoveElementThatExists [
	"self debug: #testRemoveElementThatExists"

	| el res |
	el := self nonEmptyWithoutEqualElements anyOne.
	res := self nonEmptyWithoutEqualElements remove: el.
	self assert: res == el
]

{
	#category : #'tests - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveTest>>testRemoveIfAbsent [
	"self debug: #testRemoveElementThatExists"

	| el res |
	el := self elementNotIn.
	res := self nonEmptyWithoutEqualElements remove: el ifAbsent: [ 33 ].
	self assert: res = 33
]
