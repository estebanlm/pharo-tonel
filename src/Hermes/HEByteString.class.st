"

"
Class {
	#name : #HEByteString,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteString class>>tag [
	^ 4.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteString>>asLiteralIn: env [
	^ value
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteString>>doConvertValue: aValue [
	^ aValue.
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteString>>doReadFrom: aReader [
	value := self doConvertValue:(aReader readByteString).
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEByteString>>doWriteInto: aWriter [
	aWriter writeByteString: value.
]
