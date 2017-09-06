"

"
Class {
	#name : #HEByteArray,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteArray class>>tag [
	^ 15
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteArray>>asLiteralIn: env [
	^ value
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteArray>>doReadFrom: aReader [
	value := aReader readByteArray.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteArray>>doWriteInto: aWriter [
	aWriter writeByteArray: value.
]
