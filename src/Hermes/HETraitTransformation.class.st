"

"
Class {
	#name : #HETraitTransformation,
	#superclass : #HEArray,
	#instVars : [
		'subject'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitTransformation class>>tag [
	^ 23
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitTransformation>>doReadFrom: aReader [
	super doReadFrom: aReader.
	subject := HEExportedLiteral readFrom: aReader.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitTransformation>>doWriteInto: aWriter [
	super doWriteInto: aWriter.
	subject writeInto: aWriter.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitTransformation>>value: aTraitTransformation [
	subject := aTraitTransformation subject asExportedLiteral.
]
