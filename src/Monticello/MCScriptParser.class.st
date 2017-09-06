"
A MCScriptParser identifies script and add MCScriptDefinition. 
"
Class {
	#name : #MCScriptParser,
	#superclass : #MCDoItParser,
	#category : #'Monticello-Chunk Format',
	#timestamp : '<historical>'
}

{
	#category : #'factory identification hook',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptParser class>>pattern [
	^'(PackageInfo named: *'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptParser>>addDefinitionsTo: aCollection [
	| tokens definition |
	tokens := source parseLiterals.
	definition := MCScriptDefinition
		scriptSelector: tokens second allButLast
		script: tokens third
		packageName: tokens first third.
	aCollection add: definition.
]
