"
A MCInstanceVariableDefinition represents an instance variable definition.
"
Class {
	#name : #MCInstanceVariableDefinition,
	#superclass : #MCVariableDefinition,
	#category : #Monticello-Modeling,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCInstanceVariableDefinition class>>type [
	^ #instance
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCInstanceVariableDefinition>>isInstanceVariable [
	^ true
]
