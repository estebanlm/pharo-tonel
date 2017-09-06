"
A trait for test purposes
"
Trait {
	#name : #TIncludesWithIdentityCheckTest,
	#traits : 'TIncludesTest',
	#classTraits : 'TIncludesTest classTrait',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>anotherElementNotIn [
" return an element different of 'elementNotIn'  not included in 'nonEmpty' "
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>collectionWithCopyNonIdentical [
	" return a collection that include elements for which 'copy' return a different object (this is not the case of SmallInteger)"
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>elementNotIn [
"return an element not included in 'nonEmpty' "

	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>empty [
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>nonEmpty [
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>test0FixtureIncludeTest [
	| anElementIn |
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self elementNotIn.
	anElementIn := true.
	self nonEmpty detect: [ :each | each = self elementNotIn ] ifNone: [ anElementIn := false ].
	self assert: anElementIn = false.
	self anotherElementNotIn.
	anElementIn := true.
	self nonEmpty detect: [ :each | each = self anotherElementNotIn ] ifNone: [ anElementIn := false ].
	self assert: anElementIn = false.
	self empty.
	self assert: self empty isEmpty
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>test0FixtureIncludeWithIdentityTest [
	| anElement |
	self collectionWithCopyNonIdentical.
	anElement := self collectionWithCopyNonIdentical anyOne.
	self deny: anElement == anElement copy
]

{
	#category : #'tests - including with identity',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>testIdentityIncludes [
	" test the comportement in presence of elements 'includes' but not 'identityIncludes' "
	" can not be used by collections that can't include elements for wich copy doesn't return another instance "
	| collection anElement |
	
	collection := self collectionWithCopyNonIdentical.
	anElement := collection anyOne copy.

	self deny: (collection identityIncludes: anElement)
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>testIdentityIncludesNonSpecificComportement [
	" test the same comportement than 'includes: '  "
	| collection |	
	collection := self nonEmpty  .
	
	self deny: (collection identityIncludes: self elementNotIn ).
	self assert:(collection identityIncludes: collection anyOne)

]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>testIncludesAllNoneThere [
	"self debug: #testIncludesAllOfNoneThere'"
	self deny: (self empty includesAll: self nonEmpty ).
	self deny: (self nonEmpty includesAll: { self elementNotIn. self anotherElementNotIn })
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>testIncludesAnyAllThere [
	"self debug: #testIncludesAnyOfAllThere'"
	self deny: (self nonEmpty includesAny: self empty).
	self assert: (self nonEmpty includesAny: { self nonEmpty anyOne }).
	self assert: (self nonEmpty includesAny: self nonEmpty).
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>testIncludesAnyNoneThere [
	"self debug: #testIncludesAnyOfNoneThere'"
	
	self deny: (self nonEmpty includesAny: self empty).
	self deny: (self nonEmpty includesAny: { self elementNotIn. self anotherElementNotIn })
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>testIncludesElementIsNotThere [
	"self debug: #testIncludesElementIsNotThere"
	
	self deny: (self nonEmpty includes: self elementNotIn).
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
	self deny: (self empty includes: self elementNotIn)
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesWithIdentityCheckTest>>testIncludesElementIsThere [
	"self debug: #testIncludesElementIsThere"
	
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
]
