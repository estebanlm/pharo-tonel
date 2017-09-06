"
I'm a simple container of MCDefinitions which can be added or removed.
"
Class {
	#name : #MCDefinitionIndex,
	#superclass : #Object,
	#instVars : [
		'definitions'
	],
	#category : #Monticello-Patching,
	#timestamp : 'LaurentLaffont 3/31/2011 21:06'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinitionIndex class>>definitions: aCollection [
	^ self new addAll: aCollection
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinitionIndex>>add: aDefinition [
	^ definitions at: aDefinition description put: aDefinition
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinitionIndex>>addAll: aCollection [
	aCollection do: [:ea | self add: ea]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinitionIndex>>definitionLike: aDefinition ifPresent: foundBlock ifAbsent: errorBlock [
	| definition |
	definition := definitions at: aDefinition description ifAbsent: [].
	^ definition
		ifNil: errorBlock
		ifNotNil: [foundBlock value: definition]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinitionIndex>>definitions [
	^ definitions values
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinitionIndex>>initialize [
	super initialize.
	definitions := Dictionary new
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinitionIndex>>remove: aDefinition [
	definitions removeKey: aDefinition description ifAbsent: []
]
