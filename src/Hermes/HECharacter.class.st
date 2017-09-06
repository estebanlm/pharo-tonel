"

"
Class {
	#name : #HECharacter,
	#superclass : #HEByteString,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HECharacter class>>tag [
	^ 5.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HECharacter>>asLiteralIn: env [
	^ value at:1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HECharacter>>value: aValue [
	value := aValue asString.
]
