"
A trait for test purposes
"
Trait {
	#name : #TAddForIdentityCollectionsTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddForIdentityCollectionsTest>>identityCollectionWithElementsCopyNotIdentical [
	"Returns a collection including elements for which #copy doesn't return the same object."
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddForIdentityCollectionsTest>>test0FixtureAddForIdentityCollectionsTest [
	
	self identityCollectionWithElementsCopyNotIdentical.
	self identityCollectionWithElementsCopyNotIdentical  do: [ : each | self deny: each == each copy ].
]

{
	#category : #'tests - adding for identity collections',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAddForIdentityCollectionsTest>>testTAddIfNotPresentWithElementCopy [
" test specific to IdentityCollections for wich #addIfNotPresent should use == check insted of =."
	| added oldSize collection element elementCopy |
	collection := self identityCollectionWithElementsCopyNotIdentical   .
	oldSize := collection  size.
	
	element := collection  anyOne .
	elementCopy := element copy.
	self deny: (collection  includes: elementCopy ).
	
	added := collection  addIfNotPresent: elementCopy  .
	self assert: added == elementCopy . "test for identiy because #add: has not reason to copy its parameter."
	self assert: (collection  size = (oldSize + 1)).

	
]
