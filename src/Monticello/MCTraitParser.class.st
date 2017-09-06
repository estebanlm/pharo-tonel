"
A MCTraitParser extracts an MCTraitDefinition from the source.
"
Class {
	#name : #MCTraitParser,
	#superclass : #MCDoItParser,
	#category : #'Monticello-Chunk Format',
	#timestamp : '<historical>'
}

{
	#category : #'factory identification hook',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitParser class>>pattern [
	^ 'Trait named:*'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitParser>>addDefinitionsTo: aCollection [
	| tokens  definition traitCompositionString |
	tokens := source parseLiterals.
	traitCompositionString := (source readStream
		match: 'uses:';
		upToAll: 'category:') trimBoth.
	definition := MCTraitDefinition
		name: (tokens at: 3) 
		traitComposition: traitCompositionString
		category:  tokens last
		comment:  ''  
		commentStamp:   ''.
	aCollection add: definition.
]
