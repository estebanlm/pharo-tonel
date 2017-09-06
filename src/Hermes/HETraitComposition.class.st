"

"
Class {
	#name : #HETraitComposition,
	#superclass : #HEArray,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitComposition class>>tag [
	^18
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitComposition>>asLiteralIn: env [
	^ TraitComposition new
		transformations: (value collect: [ :e | e asLiteralIn: env ]) asOrderedCollection;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitComposition>>value: aTraitComposition [
	value := aTraitComposition transformations asArray collect:#asExportedLiteral.
]
