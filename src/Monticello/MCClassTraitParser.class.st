"
MCClassTraitParser identifies classTrait. 
"
Class {
	#name : #MCClassTraitParser,
	#superclass : #MCDoItParser,
	#category : #'Monticello-Chunk Format',
	#timestamp : '<historical>'
}

{
	#category : #'factory identification hook',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitParser class>>pattern [
	^ '*classTrait*uses:*'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitParser>>addDefinitionsTo: aCollection [
	| tokens  definition traitCompositionString |
	tokens := source parseLiterals.
	traitCompositionString := (source readStream
		match: 'uses:';
		upToEnd) trimBoth.
	definition := MCClassTraitDefinition
		baseTraitName: (tokens at: 1) 
		classTraitComposition: traitCompositionString.
	aCollection add: definition

]
