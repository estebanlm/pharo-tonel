"
A variable definition
"
Class {
	#name : #RGVariableDefinition,
	#superclass : #RGElementDefinition,
	#category : #Ring-Core-Kernel,
	#timestamp : 'TorstenBergmann 2/12/2014 23:07'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>= aRGVariableDefinition [
	"This variable look for equality of the key properties of the receiver"

	^(super = aRGVariableDefinition)
		and:[ self name == aRGVariableDefinition name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>environment [

	^ self parent environment 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>fullName [
	"Keeps a unique description for the receiver. As annotation to avoid converting each time is invoked"
	
	^self annotationNamed: self class fullNameKey
		ifAbsentPut:[ (self parentName, '->', self name) asSymbol ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>hash [

	^super hash bitXor: self name hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>isClassInstanceVariable [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>isClassVariable [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>isInstanceVariable [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>isPoolVariable [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGVariableDefinition>>isVariable [

	^true
]
