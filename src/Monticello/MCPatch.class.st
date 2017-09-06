"
I represent a set of patch operations which can be applied by sending message applyTo: to my instances. 
"
Class {
	#name : #MCPatch,
	#superclass : #Object,
	#instVars : [
		'operations'
	],
	#category : #Monticello-Patching,
	#timestamp : 'StephaneDucasse 6/24/2011 14:11'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatch class>>fromBase: baseSnapshot target: targetSnapshot [
	^ self new initializeWithBase: baseSnapshot target: targetSnapshot
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatch class>>operations: aCollection [
	^ self basicNew initializeWithOperations: aCollection
]

{
	#category : #applying,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatch>>applyTo: anObject [
	operations do: [:ea | ea applyTo: anObject].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatch>>hasConflict [
	^ self operations anySatisfy: [ :change| change isConflict ]
]

{
	#category : #intializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatch>>initializeWithBase: baseSnapshot target: targetSnapshot [
	| base target |	
	operations := OrderedCollection new.
	base := MCDefinitionIndex definitions: baseSnapshot definitions.
	target := MCDefinitionIndex definitions: targetSnapshot definitions.
	
	target definitions 
		do: [ :t |
			base
				definitionLike: t
				ifPresent: [:b | (b isSameRevisionAs: t) ifFalse: [operations add: (MCModification of: b to: t)]]
				ifAbsent:  [operations add: (MCAddition of: t)] ]
		displayingProgress: 'Diffing...'.
		
	base definitions do: [:b |
		target
			definitionLike: b
			ifPresent: [:t |]
			ifAbsent: [operations add: (MCRemoval of: b)]]		
]

{
	#category : #intializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatch>>initializeWithOperations: aCollection [
	operations := aCollection
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatch>>isEmpty [
	^ operations isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPatch>>operations [
	^ operations
]
