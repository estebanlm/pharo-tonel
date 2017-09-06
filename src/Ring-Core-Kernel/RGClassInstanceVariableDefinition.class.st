"
A class instance variable definition
"
Class {
	#name : #RGClassInstanceVariableDefinition,
	#superclass : #RGVariableDefinition,
	#category : #Ring-Core-Kernel,
	#timestamp : 'TorstenBergmann 2/12/2014 23:07'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassInstanceVariableDefinition>>initialize  [

	super initialize.
	self isMetaSide: true.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassInstanceVariableDefinition>>isClassInstanceVariable [

	^true
]
