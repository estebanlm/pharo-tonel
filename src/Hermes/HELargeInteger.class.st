Class {
	#name : #HELargeInteger,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model
}

{ #category : #accessing }
HELargeInteger class >> tag [
	^ 14
]

{ #category : #converting }
HELargeInteger >> asLiteralIn: env [
	^ value
]

{ #category : #writing }
HELargeInteger >> doReadFrom: aReader [
	| anArray isNegative |
	isNegative := aReader readByte = 1.
	anArray := aReader readByteArray.

	value := isNegative
		ifTrue: [ LargeNegativeInteger new: anArray size ]
		ifFalse: [ LargePositiveInteger new: anArray size ].

	1 to: anArray size do: [ :idx | value at: idx put: (anArray at: idx) ].

]

{ #category : #writing }
HELargeInteger >> doWriteInto: aWriter [
	| anArray |
	aWriter writeByte: (value sign < 0 ifTrue: [ 1 ]	ifFalse: [ 0 ]).
	anArray := ByteArray new: value size.
	1 to:value size do:[:idx | anArray at:idx put:(value at:idx)].
	aWriter writeByteArray: anArray.
]
