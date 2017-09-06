"
A global variable definition
"
Class {
	#name : #RGGlobalVariableDefinition,
	#superclass : #RGGlobalDefinition,
	#instVars : [
		'value'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'TorstenBergmann 2/12/2014 23:08'
}

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGGlobalVariableDefinition>>addInContainer: aRGContainer [

	aRGContainer addGlobalVariable: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGGlobalVariableDefinition>>isGlobalVariable [

	^true
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGGlobalVariableDefinition>>isIncludedInContainer: aRGContainer [

	^aRGContainer includesGlobalVariable: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGGlobalVariableDefinition>>isVariable [

	^true
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGGlobalVariableDefinition>>removeFromContainer: aRGContainer [

	aRGContainer removeGlobalVariable: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGGlobalVariableDefinition>>value [
	"Retrieves the current value of the global variable"

	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGGlobalVariableDefinition>>value: anObject [

	value := anObject
]
