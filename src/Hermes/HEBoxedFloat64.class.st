Class {
	#name : #HEBoxedFloat64,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model
}

{ #category : #accessing }
HEBoxedFloat64 class >> tag [
	^ 3.
]

{ #category : #converting }
HEBoxedFloat64 >> asLiteralIn: env [
	^ value.
]

{ #category : #reading }
HEBoxedFloat64 >> doReadFrom: aReader [
	value := BoxedFloat64 new.
	value at:1 put: (aReader readUInt).
	value at:2 put: (aReader readUInt).	
]

{ #category : #writing }
HEBoxedFloat64 >> doWriteInto: aWriter [
	aWriter writeUInt: (value at:1).
	aWriter writeUInt: (value at:2).	
]
