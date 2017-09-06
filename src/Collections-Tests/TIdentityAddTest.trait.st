"
A trait for test purposes
"
Trait {
	#name : #TIdentityAddTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIdentityAddTest>>collection [
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TIdentityAddTest>>element [
	^ self explicitRequirement
]

{
	#category : #'tests - identity adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIdentityAddTest>>equalNotIdenticalElement [
	^ self element copy
]

{
	#category : #'tests - identity adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
TIdentityAddTest>>testIdentityAdd [
	| added oldSize |
	oldSize := self collection size.
	self collection add: self element.
	self deny: (self collection includes: self equalNotIdenticalElement).
	
	added := self collection add: self equalNotIdenticalElement.
	self assert: added == self equalNotIdenticalElement.
	self assert: (self collection includes: self equalNotIdenticalElement)
]
