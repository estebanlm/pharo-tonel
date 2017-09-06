"
A trait for test purposes
"
Trait {
	#name : #TCopyPreservingIdentityTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopyPreservingIdentityTest>>nonEmpty [
	self explicitRequirement
]

{
	#category : #'tests - copy',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopyPreservingIdentityTest>>testCopyReturnsIdentity [
	"self debug: #testCopyReturnsIdentity"
	
	| copy | 
	copy := self nonEmpty copy.
	self assert: self nonEmpty == copy.
	
]
