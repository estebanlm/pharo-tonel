"
RBLiteralToken is the first-class representation of a literal token (entire literals, even literal arrays, are a single token in the ST80 grammar.).

Instance Variables:
	stopPosition	<Integer>	The position within the source code where the token terminates.


"
Class {
	#name : #RBLiteralToken,
	#superclass : #RBValueToken,
	#instVars : [
		'stopPosition',
		'source'
	],
	#category : #AST-Core-Tokens,
	#timestamp : 'md 8/9/2005 14:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken class>>value: anObject  [
	| literal |
	literal := anObject class == Array 
				ifTrue: [anObject collect: [:each | self value: each]]
				ifFalse: [anObject].
	^self 
		value: literal
		start: nil
		stop: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken class>>value: aString start: anInteger stop: stopInteger  [
	^ self value: aString start: anInteger stop: stopInteger source: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken class>>value: aString start: anInteger stop: stopInteger source: sourceText [
	^(self new)
		value: aString
			start: anInteger
			stop: stopInteger;
			source: sourceText;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>isLiteralToken [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>isMultiKeyword [
	^false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>length [
	^stopPosition - self start + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>realValue [
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>source [
	^source
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>source: aString  [
	source := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>stop: anObject  [
	stopPosition := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>storeOn: aStream  [
	value isSymbol 
		ifTrue: 
			[aStream nextPut: $#.
			((RBScanner isSelector: value) and: [value ~~ #'||']) 
				ifTrue: [aStream nextPutAll: value]
				ifFalse: [value asString printOn: aStream].
			^self].
	value class == Character 
		ifTrue: 
			[aStream
				nextPut: $$;
				nextPut: value.
			^self].
	value storeOn: aStream
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralToken>>value: aString start: anInteger stop: stopInteger  [
	value := aString.
	sourcePointer := anInteger.
	stopPosition := stopInteger
]
