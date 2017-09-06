"

"
Class {
	#name : #HETraitExclusion,
	#superclass : #HETraitTransformation,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitExclusion class>>tag [
	^ 21.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitExclusion>>asLiteralIn: env [
	^ TraitExclusion new
		exclusions: (value collect: [ :e | e asLiteralIn: env ]);
		subject: (subject asLiteralIn: env);
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitExclusion>>value: aTraitExclusion [
	super value: aTraitExclusion.
	value := aTraitExclusion exclusions collect:#asExportedLiteral.
]
