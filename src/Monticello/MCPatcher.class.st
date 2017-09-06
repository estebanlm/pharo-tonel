"
I can add or remove or modify definitions. My main purpose is to generate monticello snapshot out of multiple snapshots or definitions by using my most used method #apply:to:.
"
Class {
	#name : #MCPatcher,
	#superclass : #Object,
	#instVars : [
		'definitions'
	],
	#category : #Monticello-Patching,
	#timestamp : 'LaurentLaffont 3/31/2011 21:05'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatcher class>>apply: aPatch to: aSnapshot [
	| loader |
	loader := self snapshot: aSnapshot.
	aPatch applyTo: loader.
	^ loader patchedSnapshot
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatcher class>>snapshot: aSnapshot [
	^ self new initializeWithSnapshot: aSnapshot
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatcher>>addDefinition: aDefinition [
	definitions add: aDefinition
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatcher>>initializeWithSnapshot: aSnapshot [
	definitions := MCDefinitionIndex definitions: aSnapshot definitions
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatcher>>modifyDefinition: baseDefinition to: targetDefinition [
	self addDefinition: targetDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatcher>>patchedSnapshot [
	^ MCSnapshot fromDefinitions: definitions definitions
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatcher>>removeDefinition: aDefinition [
	definitions remove: aDefinition
]
