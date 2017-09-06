"
A test mock for pairs
"
Class {
	#name : #FLPair,
	#superclass : #Object,
	#instVars : [
		'left',
		'right'
	],
	#category : #FuelTests-Mocks,
	#timestamp : 'TorstenBergmann 2/3/2014 23:23'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>= anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ self right = anObject right and: [ self left = anObject left ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self right hash bitXor: self left hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>left [
	^ left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>left: anObject [
	left := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>method1 [
	self name.
	self printString.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>method2 [
	self name.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>methodWithTemp [
	| string |
	string := 'test'.
	self name.
	self printString.
	
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: '(';
		print: left;
		space;
		print: right;
		nextPutAll: ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>right [
	^ right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPair>>right: anObject [
	right := anObject
]
