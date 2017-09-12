Class {
	#name : #HESmallInteger,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model
}

{ #category : #accessing }
HESmallInteger class >> tag [
	^ 8.
]

{ #category : #converting }
HESmallInteger >> asLiteralIn: env [
	^ value
]

{ #category : #reading }
HESmallInteger >> doReadFrom: aReader [
	value := aReader readInt
]

{ #category : #writing }
HESmallInteger >> doWriteInto: aWriter [
	aWriter writeInt: value.
]
