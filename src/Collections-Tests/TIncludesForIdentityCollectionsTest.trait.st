"
A trait for test purposes
"
Trait {
	#name : #TIncludesForIdentityCollectionsTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesForIdentityCollectionsTest>>identityCollectionWithElementsCopyNotIdentical [
	" return a collection including elements for which #copy return a new object "
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesForIdentityCollectionsTest>>test0FixtureInludesForIdentityCollectionsTest [
	self identityCollectionWithElementsCopyNotIdentical.
	self identityCollectionWithElementsCopyNotIdentical do: [ :each | self deny: each == each copy ]
]

{
	#category : #'tests - including for identity collections',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesForIdentityCollectionsTest>>testIdentityIncludesForIdentityCollections [
	" test the comportement in presence of elements 'includes' but not 'identityIncludes' "
	" can not be used by collections that can't include elements for wich copy doesn't return another instance "
	| collection element |
	collection := self identityCollectionWithElementsCopyNotIdentical .
	element := collection anyOne copy.
	self deny: (collection identityIncludes: element)
]

{
	#category : #'tests - including for identity collections',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesForIdentityCollectionsTest>>testIncludesAllOfForIdentityCollections [
	"self debug: #testIncludesAllOfAllThere'"
	| collection copyCollection |
	collection := self identityCollectionWithElementsCopyNotIdentical .
	copyCollection := OrderedCollection new.
	collection do: [ :each | copyCollection add: each copy ].
	self assert: (collection includesAll: collection).
	self deny: (collection includesAll: copyCollection).
	self deny: (collection includesAll: {  (copyCollection anyOne)  })
]

{
	#category : #'tests - including for identity collections',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesForIdentityCollectionsTest>>testIncludesAnyOfForIdentityCollections [
	"self debug: #testIncludesAnyOfAllThere'"
	| collection copyCollection |
	collection := self identityCollectionWithElementsCopyNotIdentical .
	copyCollection := OrderedCollection new.
	collection do: [ :each | copyCollection add: each copy ].
	self deny: (collection includesAny: copyCollection).
	self assert: (collection includesAny: {  (collection anyOne)  })
]

{
	#category : #'tests - including for identity collections',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesForIdentityCollectionsTest>>testIncludesForIdentityCollections [
	"self debug: #testIncludesElementIsThere"
	| collection element elementCopy |
	collection := self identityCollectionWithElementsCopyNotIdentical .
	element := collection anyOne.
	elementCopy := element copy.
	self assert: (collection includes: element).
	self deny: (collection includes: elementCopy)
]
