"

"
Class {
	#name : #HESmallInteger,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HESmallInteger class>>tag [
	^ 8.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HESmallInteger>>asLiteralIn: env [
	^ value
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HESmallInteger>>doReadFrom: aReader [
	value := aReader readInt
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HESmallInteger>>doWriteInto: aWriter [
	aWriter writeInt: value.
]
