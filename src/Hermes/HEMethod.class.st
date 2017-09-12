Class {
	#name : #HEMethod,
	#superclass : #HEAbstractExported,
	#instVars : [
		'className',
		'name',
		'header',
		'literals',
		'bytecode',
		'protocol'
	],
	#category : #Hermes-Model
}

{ #category : #'instance creation' }
HEMethod class >> for: aMethod [
	^ self new
		fromMethod: aMethod;
		yourself
]

{ #category : #accessing }
HEMethod >> bytecode [
	^ bytecode
]

{ #category : #accessing }
HEMethod >> bytecode: anObject [
	bytecode := anObject
]

{ #category : #accessing }
HEMethod >> className [
	^ className
]

{ #category : #accessing }
HEMethod >> className: anObject [
	className := anObject
]

{ #category : #'instance creation' }
HEMethod >> fillLiteralsAndBytecode: aMethod [
	| literalSpace |
	
	header := aMethod header.

	literalSpace := (aMethod numLiterals + 1) * 4.

	bytecode := ByteArray new: aMethod size - literalSpace.
	1 to: bytecode size do: [ :i | bytecode at: i put: (aMethod at: i + literalSpace) ].

	literals := aMethod literals allButLast collect: [ :e | e asExportedLiteral ].
	"The last literal is the binding of the method with the holding class, it is easy to reconstruct"
	literals := literals copyWith: nil asExportedLiteral.
]

{ #category : #'instance creation' }
HEMethod >> fromMethod: aMethod [
	name := aMethod selector.
	className := aMethod methodClass name.
	protocol := aMethod protocol.
	self fillLiteralsAndBytecode: aMethod
]

{ #category : #accessing }
HEMethod >> header [
	^ header
]

{ #category : #accessing }
HEMethod >> header: anObject [
	header := anObject
]

{ #category : #accessing }
HEMethod >> literals [
	^ literals
]

{ #category : #accessing }
HEMethod >> literals: anObject [
	literals := anObject
]

{ #category : #accessing }
HEMethod >> name [
	^ name
]

{ #category : #accessing }
HEMethod >> name: anObject [
	name := anObject
]

{ #category : #printing }
HEMethod >> printOn: aStream [
	aStream
		nextPutAll: 'HEMethod ( ';
		nextPutAll: name printString;
		nextPutAll: ' )'
]

{ #category : #accessing }
HEMethod >> protocol [
	^ protocol
]

{ #category : #accessing }
HEMethod >> protocol: anObject [
	protocol := anObject
]

{ #category : #reading }
HEMethod >> readFrom: aReader [
	| numberOfLiterals |
	name := aReader readByteSymbol.
	className := aReader readByteSymbol.
	protocol := aReader readByteSymbol.
	header := aReader readInt.
	bytecode := aReader readByteArray.

	numberOfLiterals := aReader readInt.
	literals := Array new: numberOfLiterals.
	1 to: numberOfLiterals do: [ :idx | literals at:idx put: (HEExportedLiteral readFrom: aReader) ]
]

{ #category : #writing }
HEMethod >> writeInto: aWriter [
	aWriter writeByteString: name.
	aWriter writeByteString: className.
	aWriter writeByteString: protocol.
	aWriter writeInt: header.
	aWriter writeByteArray: bytecode.
	
	aWriter writeInt: literals size.
	literals do:[:e | e writeInto: aWriter].
]
