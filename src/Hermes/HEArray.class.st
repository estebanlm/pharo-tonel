"

"
Class {
	#name : #HEArray,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEArray class>>tag [
	^ 2.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEArray>>asLiteralIn: env [
	^ value collect: [ :e | e asLiteralIn: env ]
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEArray>>doReadFrom: aReader [
	| size | 
	size := aReader readInt.
	value := Array new:size.
	
	1 to:size do:[:idx | value at:idx put: (HEExportedLiteral readFrom: aReader)].
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEArray>>doWriteInto: aWriter [
	aWriter writeInt: value size.
	value do:[:e | e writeInto: aWriter].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEArray>>value: anArray [
	value := anArray collect:#asExportedLiteral
]
