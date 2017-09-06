"
A MCRemoval represents the removal of an entity of a given snapshot.
"
Class {
	#name : #MCRemoval,
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
MCRemoval class>>of: aDefinition [
	^ self new intializeWithDefinition: aDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>baseDefinition [
	^ definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>basicApplyTo: anObject [
	anObject removeDefinition: definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>definition [
	^ definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>fromSource [
	^ definition diffSource
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>intializeWithDefinition: aDefinition [
	definition := aDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>inverse [
	^ MCAddition of: definition
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>isClassPatch [
	^definition isClassDefinition
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>isRemoval [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>summarySuffix [
	^ ' (removed)'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>targetClass [
	^ definition actualClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>targetDefinition [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemoval>>toSource [
	^ ''
]
