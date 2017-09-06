"

"
Class {
	#name : #HEMethodLiteral,
	#superclass : #HEExportedLiteral,
	#instVars : [
		'className',
		'selector'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodLiteral class>>tag [
	^ 10.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodLiteral>>asLiteralIn: env [
	^ (env newClass name = className and: [ env newSelector = selector ])
		ifTrue: [ env newMethod ]
		ifFalse: [ (env classNamed: className) >> selector ]
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodLiteral>>doReadFrom: aReader [
	className := aReader readByteSymbol.
	selector := aReader readByteSymbol.


]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodLiteral>>doWriteInto: aWriter [
	aWriter writeByteString: className.
	aWriter writeByteString: selector.


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEMethodLiteral>>value: aMethod [
	className := aMethod methodClass name.
	selector := aMethod selector.
]
