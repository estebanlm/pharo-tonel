"
A trait for test purposes
"
Trait {
	#name : #TPutBasicTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:35'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>aValue [
" return a value to put into nonEmpty"
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>anIndex [
" return an index in nonEmpty bounds"
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>anotherValue [
" return a value ( not eual to 'aValue' ) to put into nonEmpty "
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>empty [
	^self explicitRequirement.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>nonEmpty [

	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>test0FixturePutTest [
	self aValue.
	self anotherValue.
	
	self anIndex.
	self nonEmpty isDictionary 
		ifFalse:[self assert: (self anIndex >=1 & self anIndex <= self nonEmpty size).].
	
	self empty.
	self assert: self empty isEmpty .
	
	self nonEmpty.
	self deny: self nonEmpty  isEmpty.
]

{
	#category : #'tests - at put',
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>testAtPut [
	"self debug: #testAtPut"
	
	self nonEmpty at: self anIndex put: self aValue.
	self assert: (self nonEmpty at: self anIndex) = self aValue.
	
]

{
	#category : #'tests - at put',
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>testAtPutOutOfBounds [
	"self debug: #testAtPutOutOfBounds"
	
	self should: [self empty at: self anIndex put: self aValue] raise: Error
	
]

{
	#category : #'tests - at put',
	#timestamp : ' 8/31/2017 05:26:28'
}
TPutBasicTest>>testAtPutTwoValues [
	"self debug: #testAtPutTwoValues"
	
	self nonEmpty at: self anIndex put: self aValue.
	self nonEmpty at: self anIndex put: self anotherValue.
	self assert: (self nonEmpty at: self anIndex) = self anotherValue.
]
