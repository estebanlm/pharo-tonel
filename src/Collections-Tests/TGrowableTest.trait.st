"
A trait for test purposes
"
Trait {
	#name : #TGrowableTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TGrowableTest>>element [

	^ self explicitRequirement 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TGrowableTest>>elementNotIn [
	
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TGrowableTest>>empty  [

	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TGrowableTest>>nonEmpty  [

	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TGrowableTest>>test0FixtureRequirementsOfTGrowableTest [
	self empty.
	self nonEmpty.
	self element.
	self elementNotIn.
	self assert: self empty isEmpty.
	self deny: self nonEmpty isEmpty.
	self assert: (self nonEmpty includes: self element).
	self deny: (self nonEmpty includes: self elementNotIn)
]

{
	#category : #'tests - growable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TGrowableTest>>testAddEmptyGrows [
	"self debug: #testAddEmptyGrows"
	
	| oldSize |
	oldSize := self empty size.
	self empty add: self element.
	self assert: (self empty size) = (oldSize + 1).
]

{
	#category : #'tests - growable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TGrowableTest>>testAddNonEmptyGrowsWhenNewElement [
	"self debug: #testAddNonEmptyGrowsWhenNewElement"
	
	| oldSize |
	oldSize := self nonEmpty size.
	
	self nonEmpty add: self elementNotIn.
	self assert: (self nonEmpty size) > oldSize.
]
