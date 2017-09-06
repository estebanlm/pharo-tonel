"
I am an abstraction used by the materialization algorithm to decode the graph from a stream.
"
Class {
	#name : #FLDecoder,
	#superclass : #Object,
	#instVars : [
		'stream',
		'objects',
		'isBigEndian',
		'indexStream',
		'migrations',
		'objectsWriteStream',
		'globalEnvironment'
	],
	#category : #Fuel-Core,
	#timestamp : 'MartinDias 1/6/2012 16:08'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder class>>on: aStream migrations: aCollection globalEnvironment: aDictionary [
	
	^self basicNew
		initializeOn: aStream 
		migrations: aCollection 
		globalEnvironment: aDictionary;
		yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>classNamed: className  [

	^ (migrations
		detect: [:m | m sourceClassName = className ]
		ifNone: [ ^ self globalClassNamed: className ])
		targetClass.
		
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>decodeYourself [

	| objectCount |
	objectCount := self nextEncodedPositiveInteger.
	
	indexStream := FLIndexStream on: stream digits: objectCount digitLength.
	objects := Array new: objectCount.
	objectsWriteStream := WriteStream on: objects.

	isBigEndian := self nextEncodedPositiveInteger.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>globalClassNamed: className [

	^ globalEnvironment 
		at: className
		ifAbsent: [ FLClassNotFound signalWithName: className ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>globalEnvironment [
	"Answer a dictionary where the look up for global symbols will be done during materialization."
	
	^ globalEnvironment
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>initializeOn: aStream migrations: aCollection globalEnvironment: aDictionary  [

	self initialize.
	stream := aStream.
	migrations := aCollection.
	globalEnvironment := aDictionary.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>isBigEndian [
	^ isBigEndian
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedBitmap [

	^ Bitmap newFromStream: stream
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedByte [
	^stream next
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedBytesInto: aBytesObject [
	stream next: aBytesObject basicSize into: aBytesObject 
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedClusterClass [

	^ self class environment at: self nextEncodedString asSymbol
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedInt24 [
	| n firstDigit |
	n := firstDigit := stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	firstDigit >= 128 ifTrue: [n := -16r1000000 + n].  "decode negative 24-bit integer"
	^ n

]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedInt32 [
	| n firstDigit |
	n := firstDigit := stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	firstDigit >= 128 ifTrue: [n := -16r100000000 + n].  "decode negative 32-bit integer"
	^ n

]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedPositiveInteger [
	"Read a 32-bit signed integer from the next 4 bytes"
	| s |
	s := 0.
	1 to: 4 do: [:i | s := (s bitShift: 8) + stream next].
	^ s
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedReference  [

	^ objects at: indexStream nextIndex
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedString [
	| length aByteArray |

	"read the length in binary mode"
	length := stream next.		"first byte."
	length >= 192 ifTrue: [length := length - 192.
		1 to: 3 do: [:ii | length := length * 256 + stream next]].
	aByteArray := ByteArray new: length.

	stream nextInto: aByteArray.
	^aByteArray asString.

]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedUint16 [
	"Answer the next unsigned, 16-bit integer from this (binary) stream."
	^ (stream next bitShift: 8) + (stream next).
	
]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedUint24 [
	"Answer the next unsigned, 24-bit integer from this (binary) stream."

	| n |
	n := stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	^ n

]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedUint32 [
	"Answer the next unsigned, 32-bit integer from this (binary) stream."

	| n |
	n := stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	^ n

]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedUint8 [
	"Answer the next unsigned, 16-bit integer from this (binary) stream."
	^ stream next.
	

]

{
	#category : #decoding,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>nextEncodedWordsInto: aWordsObject  [
	stream fuelNextWordsInto: aWordsObject 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>objects [
	^ objects
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>registerAll: someObjects [

	objectsWriteStream nextPutAll: someObjects.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLDecoder>>variablesMappingFor: aClass [

	| variables |
	variables := FLVariablesMapping materializing: aClass from: self.
	
	migrations 
		select: [ :m | (m targetClass == aClass) or: [ aClass inheritsFrom: m targetClass ] ]
		thenDo: [ :m | m applyTo: variables ].
		
	^ variables
	
]
