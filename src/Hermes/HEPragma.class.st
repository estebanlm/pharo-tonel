"

"
Class {
	#name : #HEPragma,
	#superclass : #HEExportedLiteral,
	#instVars : [
		'method',
		'arguments',
		'keyword'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEPragma class>>tag [
	^ 11.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEPragma>>arguments [
	^ arguments
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEPragma>>asLiteralIn: env [
	^ Pragma for: (method asLiteralIn: env) selector: (keyword asLiteralIn: env) arguments: (arguments asLiteralIn: env)
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEPragma>>doReadFrom: aReader [
	method := HEExportedLiteral readFrom: aReader.
	keyword := HEExportedLiteral readFrom: aReader.
	arguments := HEExportedLiteral readFrom: aReader.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEPragma>>doWriteInto: aWriter [
	method writeInto: aWriter.
	keyword writeInto: aWriter.
	arguments writeInto: aWriter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEPragma>>keyword [
	^ keyword
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEPragma>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEPragma>>value: aPragma [
	method := aPragma method asExportedLiteral.
	keyword := aPragma keyword asExportedLiteral.
	arguments := aPragma arguments asExportedLiteral 
]
