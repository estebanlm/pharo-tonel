"
A MCClassVariableDefinition represent a class variable.
"
Class {
	#name : #MCClassVariableDefinition,
	#superclass : #MCVariableDefinition,
	#category : #Monticello-Modeling,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassVariableDefinition class>>type [
	^ #class
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassVariableDefinition>>isClassVariable [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassVariableDefinition>>isOrderDependend [
	^false
]
