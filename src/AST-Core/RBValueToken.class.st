"
RBValueToken is the abstract superclass of all tokens that have additional information attached. For example, the BinarySelector token holds onto the actual character (e.g. $+).

Instance Variables:
	value	<String>	The value of this token


"
Class {
	#name : #RBValueToken,
	#superclass : #RBToken,
	#instVars : [
		'value'
	],
	#category : #AST-Core-Tokens,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueToken class>>value: aString start: anInteger  [
	^self new value: aString start: anInteger
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueToken>>length [
	^value size
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueToken>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	value printOn: aStream.
	aStream nextPutAll: ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueToken>>source [
	^ self value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueToken>>value [
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueToken>>value: anObject [
	value := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueToken>>value: aString start: anInteger  [
	value := aString.
	sourcePointer := anInteger
]
