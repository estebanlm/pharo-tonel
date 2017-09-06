"
A trait for test purposes
"
Trait {
	#name : #TIncludesTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>anotherElementNotIn [
" return an element different of 'elementNotIn'  not included in 'nonEmpty' "
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>elementNotIn [
"return an element not included in 'nonEmpty' "

	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>empty [
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>nonEmpty [
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>test0FixtureIncludeTest [
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
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>testIdentityIncludesNonSpecificComportement [
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
TIncludesTest>>testIncludesAllNoneThere [
	"self debug: #testIncludesAllOfNoneThere'"
	self deny: (self empty includesAll: self nonEmpty ).
	self deny: (self nonEmpty includesAll: { self elementNotIn. self anotherElementNotIn })
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>testIncludesAnyAllThere [
	"self debug: #testIncludesAnyOfAllThere'"
	self deny: (self nonEmpty includesAny: self empty).
	self assert: (self nonEmpty includesAny: { self nonEmpty anyOne }).
	self assert: (self nonEmpty includesAny: self nonEmpty).
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>testIncludesAnyNoneThere [
	"self debug: #testIncludesAnyOfNoneThere'"
	
	self deny: (self nonEmpty includesAny: self empty).
	self deny: (self nonEmpty includesAny: { self elementNotIn. self anotherElementNotIn })
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>testIncludesElementIsNotThere [
	"self debug: #testIncludesElementIsNotThere"
	
	self deny: (self nonEmpty includes: self elementNotIn).
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
	self deny: (self empty includes: self elementNotIn)
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIncludesTest>>testIncludesElementIsThere [
	"self debug: #testIncludesElementIsThere"
	
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
]
