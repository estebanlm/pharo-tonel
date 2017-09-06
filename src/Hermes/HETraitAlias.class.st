"

"
Class {
	#name : #HETraitAlias,
	#superclass : #HETraitTransformation,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitAlias class>>tag [
	^ 20.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitAlias>>asLiteralIn: env [
	^ TraitAlias new
		aliases: (value collect: [ :e | e asLiteralIn: env ]);
		subject: (subject asLiteralIn: env); 
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitAlias>>value: aTraitAlias [
	super value:aTraitAlias.
	value := aTraitAlias aliases collect:#asExportedLiteral.
	
]
