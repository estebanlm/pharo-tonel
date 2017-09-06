"
A trait for test purposes
"
Trait {
	#name : #TBeginsEndsWith,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TBeginsEndsWith>>empty [
	self explicitRequirement.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TBeginsEndsWith>>nonEmpty [
	self explicitRequirement.
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TBeginsEndsWith>>test0FixtureBeginsEndsWithTest [
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self assert: self nonEmpty size > 1.
	self empty.
	self assert: self empty isEmpty
]

{
	#category : #'tests - begins ends with',
	#timestamp : ' 8/31/2017 05:26:28'
}
TBeginsEndsWith>>testsBeginsWith [
	
	self assert: (self nonEmpty beginsWith:(self nonEmpty copyUpTo: self nonEmpty last)).
	self assert: (self nonEmpty beginsWith:(self nonEmpty )).
	self deny: (self nonEmpty beginsWith:(self nonEmpty copyWith:self nonEmpty first)).
]

{
	#category : #'tests - begins ends with',
	#timestamp : ' 8/31/2017 05:26:28'
}
TBeginsEndsWith>>testsBeginsWithEmpty [
	
	self deny: (self nonEmpty beginsWith:(self empty)).
	self deny: (self empty beginsWith:(self nonEmpty )).

]

{
	#category : #'tests - begins ends with',
	#timestamp : ' 8/31/2017 05:26:28'
}
TBeginsEndsWith>>testsEndsWith [
	
	self assert: (self nonEmpty endsWith: self nonEmpty copyWithoutFirst).
	self assert: (self nonEmpty endsWith: self nonEmpty).
	self deny: (self nonEmpty endsWith: (self nonEmpty copyWith: self nonEmpty first)).
]

{
	#category : #'tests - begins ends with',
	#timestamp : ' 8/31/2017 05:26:28'
}
TBeginsEndsWith>>testsEndsWithEmpty [
	
	self deny: (self nonEmpty endsWith: self empty).
	self deny: (self empty endsWith: self nonEmpty).
	
]
