"
A MCClassInstanceVariableDefinition represents a class instance variable.
"
Class {
	#name : #MCClassInstanceVariableDefinition,
	#superclass : #MCVariableDefinition,
	#category : #Monticello-Modeling,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassInstanceVariableDefinition class>>type [
	^ #classInstance
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassInstanceVariableDefinition>>isClassInstanceVariable [
	^ true
]
