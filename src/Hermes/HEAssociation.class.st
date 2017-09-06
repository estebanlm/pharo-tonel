"

"
Class {
	#name : #HEAssociation,
	#superclass : #HEExportedLiteral,
	#instVars : [
		'key'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAssociation class>>tag [
	^ 12
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAssociation>>asLiteralIn: env [
	^ (key asLiteralIn: env) -> (value asLiteralIn: env)
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAssociation>>doReadFrom: aReader [
	key := HEExportedLiteral readFrom: aReader.
	value := HEExportedLiteral readFrom: aReader.

]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAssociation>>doWriteInto: aWriter [
	key writeInto: aWriter.
	value writeInto: aWriter.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAssociation>>value: anAssociation [
	value := anAssociation value asExportedLiteral.
	key := anAssociation key asExportedLiteral.
]
