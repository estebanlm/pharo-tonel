"
A trait for test purposes
"
Trait {
	#name : #TCloneTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCloneTest>>empty [

	^ self explicitRequirement
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCloneTest>>nonEmpty [

	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCloneTest>>test0FixtureCloneTest [
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self empty.
	self assert: self empty isEmpty
]

{
	#category : #'tests - copy - clone',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCloneTest>>testCopyCreatesNewObject [
	"self debug: #testCopyCreatesNewObject"
	
	| copy | 
	copy := self nonEmpty copy.
	self deny: self nonEmpty == copy.
	
]

{
	#category : #'tests - copy - clone',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCloneTest>>testCopyEmpty [
	"self debug: #testCopyEmpty"
	
	| copy | 
	copy := self empty copy.
	self assert: copy isEmpty.
]

{
	#category : #'tests - copy - clone',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCloneTest>>testCopyNonEmpty [
	"self debug: #testCopyNonEmpty"
	
	| copy | 
	copy := self nonEmpty copy.
	self deny: copy isEmpty.
	self assert: copy size = self nonEmpty size.
	self nonEmpty do: 
		[:each | copy includes: each]
]
