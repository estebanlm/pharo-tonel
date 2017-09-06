"
I'm the root of the hierarchy of the collection tests.

"
Class {
	#name : #CollectionRootTest,
	#superclass : #ClassTestCase,
	#traits : 'TIterateTest + TEmptyTest + TSizeTest',
	#classTraits : 'TIterateTest classTrait + TEmptyTest classTrait + TSizeTest classTrait',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'stephane.ducasse 1/12/2009 17:41'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest class>>isAbstract [

	^ self name = #CollectionRootTest
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>collectionWithoutNilElements [
" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"
	self subclassResponsibility
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>doWithoutNumber [

	^ 2
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>element [
	^ 3
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>elementTwiceIn [
	^ 1 "12332312322"
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>empty [
	self subclassResponsibility
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>expectedElementByDetect [

	^ -2
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>nonEmpty [

	self subclassResponsibility
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>sizeCollection [
	"Answers a collection not empty"
	^ self subclassResponsibility
]

{
	#category : #'tests - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>testDetectIfFoundIfNoneWhenNobodyIsFound [
	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ true ] ifNone: [ false ].
	self deny: wasFound
]

{
	#category : #'tests - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>testDetectIfFoundIfNoneWhenSomethingIsFound [
	| wasFound foundObject |
	foundObject := nil.
	wasFound := self collectionWithoutNilElements
		detect: [ :each | each notNil ]
		ifFound: [ :element | 
			foundObject := element.
			true ]
		ifNone: [ false ].
	self
		assert: wasFound;
		assert: (self collectionWithoutNilElements includes: foundObject)
]

{
	#category : #'tests - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>testDetectIfFoundIfNoneWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ true ] ifNone: [ false ].
	self assert: wasFound
]

{
	#category : #'tests - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>testDetectIfFoundWhenNobodyIsFound [
	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ wasFound := true ].
	self deny: wasFound
]

{
	#category : #'tests - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>testDetectIfFoundWhenSomethingIsFound [
	| wasFound foundObject |
	wasFound := false.
	foundObject := nil.
	self collectionWithoutNilElements
		detect: [ :each | each notNil ]
		ifFound: [ :element | 
			foundObject := element.
			wasFound := true ].
	self
		assert: wasFound;
		assert: (self collectionWithoutNilElements includes: foundObject)

]

{
	#category : #'tests - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>testDetectIfFoundWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ wasFound := true ].
	self assert: wasFound
]

{
	#category : #'tests - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
CollectionRootTest>>testRejectNoReject [
	| res collection |
	collection := self collectionWithoutNilElements .
	res := collection  reject: [ :each | each isNil ].
	self assert: res size = collection  size
]
