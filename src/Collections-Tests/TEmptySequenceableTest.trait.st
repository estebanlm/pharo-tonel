"
A trait for test purposes
"
Trait {
	#name : #TEmptySequenceableTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #parameters,
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>accessValuePutIn [
	"return access the element put in the non-empty collection"
	
	^ self perform: self selectorToAccessValuePutIn
]

{
	#category : #parameters,
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>accessValuePutInOn: s [

	"return access the element put in the non-empty collection"
	
	^ s perform: self selectorToAccessValuePutIn
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>empty [
	
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>nonEmpty [
	
	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>selectorToAccessValuePutIn [
	"return the selector of the method that should be invoked to access an element"
	
	^ self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>test0FixtureEmptySequenceableTest [
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self empty.
	self assert: self empty isEmpty
]

{
	#category : #'tests - sequence isempty',
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>testSequenceIfNotEmpty [

	self assert: (self nonEmpty 
					ifNotEmpty: [:s | self accessValuePutInOn: s]) = self valuePutIn
]

{
	#category : #'tests - sequence isempty',
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>testSequenceIfNotEmptyifEmpty [

	self assert: (self nonEmpty ifEmpty: [false] ifNotEmpty: [:s | (self accessValuePutInOn: s) = self valuePutIn])
]

{
	#category : #parameters,
	#timestamp : ' 8/31/2017 05:26:28'
}
TEmptySequenceableTest>>valuePutIn [
	"the value that we will put in the non empty collection"
	
	^ #x
]
