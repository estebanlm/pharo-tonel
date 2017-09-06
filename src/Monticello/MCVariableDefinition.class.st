"
A MCVariableDefinition represents a variable.
"
Class {
	#name : #MCVariableDefinition,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #Monticello-Modeling,
	#timestamp : '<historical>'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition class>>name: aString [
	^ self new name: aString
	
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>= other [
	^ (self species = other species)
		and: [self name = other name]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>hash [
	^ name hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>isClassInstanceVariable [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>isClassInstanceVariableDefinition [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>isClassVariable [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>isInstanceVariable [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>isInstanceVariableDefinition [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>isOrderDependend [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>isPoolImport [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>name: aString [
	name := aString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVariableDefinition>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(; nextPutAll: self name; nextPut: $)
]
