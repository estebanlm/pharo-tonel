"
A trait for test purposes
"
Trait {
	#name : #TAddTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>collectionWithElement [
	"Returns a collection that already includes what is returned by #element."
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>element [
	"Returns an object that can be added to the collection returned by #collection."
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>otherCollection [
	"Returns a collection that does not include what is returned by #element."
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>test0FixtureRequirementsOfTAddTest [
	self collectionWithElement.
	self otherCollection.
	self element.
	self assert: (self collectionWithElement includes: self element).
	self deny: (self otherCollection includes: self element)
]

{
	#category : #'tests - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>testTAdd [
	| added collection |
	collection :=self otherCollection .
	added := collection add: self element.
	
	self assert: added == self element.	"test for identiy because #add: has not reason to copy its parameter."
	self assert: (collection includes: self element)	.
	self assert: (self collectionWithElement includes: self element).
	
	
]

{
	#category : #'tests - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>testTAddAll [
	| added collection toBeAdded |
	collection := self collectionWithElement .
	toBeAdded := self otherCollection .
	added := collection addAll: toBeAdded .
	self assert: added == toBeAdded .	"test for identiy because #addAll: has not reason to copy its parameter."
	self assert: (collection includesAll: toBeAdded )
]

{
	#category : #'tests - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>testTAddIfNotPresentWithElementAlreadyIn [

	| added oldSize collection anElement |
	collection := self collectionWithElement .
	oldSize := collection size.
	anElement := self element .
	self assert: (collection  includes: anElement ).
	
	added := collection  addIfNotPresent: anElement .
	
	self assert: added == anElement .	"test for identiy because #add: has not reason to copy its parameter."
	self assert: collection  size = oldSize
]

{
	#category : #'tests - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>testTAddIfNotPresentWithNewElement [

	| added oldSize collection elem |
	collection := self otherCollection .
	oldSize := collection  size.
	elem := self element .
	self deny: (collection  includes: elem ).
	
	added := collection  addIfNotPresent: elem .
	self assert: added == elem . "test for identiy because #add: has not reason to copy its parameter."
	self assert: (collection  size = (oldSize + 1)).

	
]

{
	#category : #'tests - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>testTAddTwice [
	| added oldSize collection anElement |
	collection := self collectionWithElement .
	anElement := self element .
	oldSize := collection  size.
	added := collection 
		add: anElement ;
		add: anElement .
	self assert: added == anElement .	"test for identiy because #add: has not reason to copy its parameter."
	self assert: (collection  includes: anElement ).
	self assert: collection  size = (oldSize + 2)
]

{
	#category : #'tests - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>testTAddWithOccurences [
	| added oldSize collection anElement |
	collection := self collectionWithElement .
	anElement := self element .
	oldSize := collection  size.
	added := collection  add: anElement withOccurrences: 5.
	
	self assert: added == anElement.	"test for identiy because #add: has not reason to copy its parameter."
	self assert: (collection  includes: anElement).
	self assert: collection  size = (oldSize + 5)
]

{
	#category : #'tests - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>testTWrite [
	| added collection elem |
	collection := self otherCollection  .
	elem := self element .
	added := collection  write: elem .
	
	self assert: added == elem .	"test for identiy because #add: has not reason to copy its parameter."
	self assert: (collection  includes: elem )	.
	self assert: (collection  includes: elem ).
	
	
]

{
	#category : #'tests - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddTest>>testTWriteTwice [
	| added oldSize collection elem |
	collection := self collectionWithElement .
	elem := self element .
	oldSize := collection  size.
	added := collection 
		write: elem ;
		write: elem .
	self assert: added == elem .	"test for identiy because #add: has not reason to copy its parameter."
	self assert: (collection  includes: elem ).
	self assert: collection  size = (oldSize + 2)
]
