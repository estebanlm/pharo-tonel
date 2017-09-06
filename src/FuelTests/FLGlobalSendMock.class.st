"
A mock for a global send
"
Class {
	#name : #FLGlobalSendMock,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #FuelTests-Mocks,
	#timestamp : 'TorstenBergmann 2/3/2014 23:21'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock class>>newInstanceToMaterialize [
	
	^self newWith: #materializing
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock class>>newInstanceToSerialize [
	
	^self newWith: #serializing
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock class>>newWith: aByteSymbol  [
	
	^self basicNew
		initializeWith: aByteSymbol;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock>>= anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ contents = anObject contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock>>contents [
	^ contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock>>contents: anObject [
	contents := anObject
]

{
	#category : #serialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitGlobalSend: self name: #FLGlobalSendMock selector: #newInstanceToMaterialize
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock>>hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ contents hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock>>initializeWith: aByteSymbol [
	
	super initialize.
	contents := aByteSymbol 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendMock>>printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' contents: ';
		print: contents
]
