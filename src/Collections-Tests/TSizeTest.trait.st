"
A trait for test purposes
"
Trait {
	#name : #TSizeTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:35'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSizeTest>>empty [

	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSizeTest>>sizeCollection [
	"Answers a collection not empty"
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSizeTest>>test0TSizeTest [
	self empty.
	self sizeCollection.
	self assert: self empty isEmpty.
	self deny: self sizeCollection isEmpty
]

{
	#category : #'tests - size capacity',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSizeTest>>testSize [

	| size |
	self assert: self empty size = 0.
	size := 0.
	self sizeCollection do: [ :each | size := size + 1].
	
	self assert: self sizeCollection size = size.
]
