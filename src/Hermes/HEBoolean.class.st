"

"
Class {
	#name : #HEBoolean,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBoolean class>>tag [
	^ 17
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBoolean>>asLiteralIn: env [
	^ value
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBoolean>>doReadFrom: aReader [
	value := aReader readByte = 1
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBoolean>>doWriteInto: aWriter [
	aWriter writeByte:(value ifTrue:1 ifFalse:0).
]
