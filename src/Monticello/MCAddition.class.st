"
A MCAddition represents the operation to add an entity to a snapshot. 
"
Class {
	#name : #MCAddition,
	#superclass : #MCPatchOperation,
	#instVars : [
		'definition'
	],
	#category : #Monticello-Patching,
	#timestamp : '<historical>'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition class>>of: aDefinition [
	^ self new intializeWithDefinition: aDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>baseDefinition [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>basicApplyTo: anObject [
	anObject addDefinition: definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>definition [
	^ definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>fromSource [
	^ ''
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>intializeWithDefinition: aDefinition [
	definition := aDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>inverse [
	^ MCRemoval of: definition
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>isAddition [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>isClassPatch [
	^definition isClassDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>targetClass [
	^definition actualClass 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>targetDefinition [
	^ definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCAddition>>toSource [
	^ definition diffSource
]
