"

"
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
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod class>>for: aMethod [
	^ self new
		fromMethod: aMethod;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>bytecode [
	^ bytecode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>bytecode: anObject [
	bytecode := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>className [
	^ className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>className: anObject [
	className := anObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>fillLiteralsAndBytecode: aMethod [
	| literalSpace |
	
	header := aMethod header.

	literalSpace := (aMethod numLiterals + 1) * 4.

	bytecode := ByteArray new: aMethod size - literalSpace.
	1 to: bytecode size do: [ :i | bytecode at: i put: (aMethod at: i + literalSpace) ].

	literals := aMethod literals allButLast collect: [ :e | e asExportedLiteral ].
	"The last literal is the binding of the method with the holding class, it is easy to reconstruct"
	literals := literals copyWith: nil asExportedLiteral.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>fromMethod: aMethod [
	name := aMethod selector.
	className := aMethod methodClass name.
	protocol := aMethod protocol.
	self fillLiteralsAndBytecode: aMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>header [
	^ header
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>header: anObject [
	header := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>literals [
	^ literals
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>literals: anObject [
	literals := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>name: anObject [
	name := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>printOn: aStream [
	aStream
		nextPutAll: 'HEMethod ( ';
		nextPutAll: name printString;
		nextPutAll: ' )'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>protocol [
	^ protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>protocol: anObject [
	protocol := anObject
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>readFrom: aReader [
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

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethod>>writeInto: aWriter [
	aWriter writeByteString: name.
	aWriter writeByteString: className.
	aWriter writeByteString: protocol.
	aWriter writeInt: header.
	aWriter writeByteArray: bytecode.
	
	aWriter writeInt: literals size.
	literals do:[:e | e writeInto: aWriter].
]
