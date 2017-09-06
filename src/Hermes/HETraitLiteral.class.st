"

"
Class {
	#name : #HETraitLiteral,
	#superclass : #HESymbol,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitLiteral class>>tag [
	^ 19
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitLiteral>>asLiteralIn: env [
	^ env classNamed: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETraitLiteral>>value: aTrait [
	value := aTrait name.
]
