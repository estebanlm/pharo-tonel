"
IntegerArrays store 32bit signed Integer values.
Negative values are stored as 2's complement.
"
Class {
	#name : #IntegerArray,
	#superclass : #ArrayedCollection,
	#type : #words,
	#category : #Collections-Native,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:28'
}
IntegerArray>>asIntegerArray [
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
IntegerArray>>at: index [
	| word |
	<primitive: 165>
	word := self basicAt: index.
	word < 16r3FFFFFFF ifTrue:[^word]. "Avoid LargeInteger computations"
	^word >= 16r80000000	"Negative?!"
		ifTrue:["word - 16r100000000"
				(word bitInvert32 + 1) negated]
		ifFalse:[word]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
IntegerArray>>at: index put: anInteger [
	| word |
	<primitive: 166>
	anInteger < 0
		ifTrue:["word := 16r100000000 + anInteger"
				word := (anInteger + 1) negated bitInvert32]
		ifFalse:[word := anInteger].
	self  basicAt: index put: word.
	^anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
IntegerArray>>atAllPut: anInteger [
	| word |
	anInteger < 0
		ifTrue:["word := 16r100000000 + anInteger"
				word := (anInteger + 1) negated bitInvert32]
		ifFalse:[word := anInteger].
	self primFill: word.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
IntegerArray>>defaultElement [
	"Return the default element of the receiver"
	^0
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:28'
}
IntegerArray>>primFill: aPositiveInteger [
	"Fill the receiver, an indexable bytes or words object, with the given positive integer. The range of possible fill values is [0..255] for byte arrays and [0..(2^32 - 1)] for word arrays."

	<primitive: 145>
	self errorImproperStore.
]
