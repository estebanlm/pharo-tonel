"

"
Class {
	#name : #HEAbstractExported,
	#superclass : #Object,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #formatting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAbstractExported class>>readFrom: aReader [
	^ self new
		readFrom: aReader;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAbstractExported>>= anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAbstractExported>>hash [
	^ self valuesToCompareForEquality
		inject: self species hash
		into: [ :hash :comparisonValue | (hash bitXor: comparisonValue hash) hashMultiply ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAbstractExported>>instVarNamesForEqualityComparison [
	^ self class allInstVarNames
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAbstractExported>>valuesToCompareForEquality [
	^ self instVarNamesForEqualityComparison collect: [ :ivName | self instVarNamed: ivName ]
]
