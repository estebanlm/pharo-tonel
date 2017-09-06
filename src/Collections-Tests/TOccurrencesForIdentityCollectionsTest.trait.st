"
A trait for test purposes
"
Trait {
	#name : #TOccurrencesForIdentityCollectionsTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForIdentityCollectionsTest>>identityCollectionWithElementsCopyNotIdentical [
" return a collection including elements for which #copy return a new object "
^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForIdentityCollectionsTest>>test0FixtureOccurrencesForIdentityCollectionsTest [
	self identityCollectionWithElementsCopyNotIdentical.
	self identityCollectionWithElementsCopyNotIdentical do: [ :each | self deny: each copy == each ]
]

{
	#category : #'tests - occurrencesOf for identity collections',
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForIdentityCollectionsTest>>testOccurencesOfForIdentityCollections [

| collection element elementCopy |
collection := self identityCollectionWithElementsCopyNotIdentical .
element := collection anyOne.
elementCopy := element copy.

self assert: (collection occurrencesOf: elementCopy ) = 0.
]
