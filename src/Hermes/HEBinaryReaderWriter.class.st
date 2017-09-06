"

"
Class {
	#name : #HEBinaryReaderWriter,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #Hermes,
	#timestamp : ''
}

{
	#category : #sizes,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>byteArraySize: aByteArray [
	^ self intSize + aByteArray size.

]

{
	#category : #sizes,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>byteStringSize: aString [
	^ self byteArraySize: aString asArray

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>close [
	self stream close.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>flush [
	stream flush
]

{
	#category : #sizes,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>intSize [
	^ 4
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>readByte [
	^ stream next
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>readByteArray [
	| byteArray size |
	size := self readInt. 
	byteArray := stream next: size.
	^ byteArray
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>readByteString [
	^ self readByteArray asString
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>readByteSymbol [
	^ self readByteString asSymbol 
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>readInt [
	| byteArray n |
	byteArray := stream next: self intSize.
	n := byteArray at: 4.
	n := (n bitShift: 8) + (byteArray at: 3).
	n := (n bitShift: 8) + (byteArray at: 2).
	n := (n bitShift: 8) + (byteArray at: 1).
	(byteArray at: 4) >= 128
		ifTrue: [ n := -16r100000000 + n ].
	^ n
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>readUInt [
	| byteArray n |
	byteArray := stream next: self intSize.
	n := byteArray at: 4.
	n := (n bitShift: 8) + (byteArray at: 3).
	n := (n bitShift: 8) + (byteArray at: 2).
	n := (n bitShift: 8) + (byteArray at: 1).
	^ n
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>stream [
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>stream: anObject [
	stream := anObject
]

{
	#category : #writting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>writeByte: aNumber [
	stream nextPut: aNumber
]

{
	#category : #writting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>writeByteArray: byteArray [
	self writeInt: byteArray size.
	stream nextPutAll: byteArray.
]

{
	#category : #writting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>writeByteString: aString [
	self writeByteArray: aString asByteArray
]

{
	#category : #writting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>writeInt: aNumber [
	| numberToSave |
	numberToSave := aNumber < 0
		ifTrue: [ (0 - aNumber) bitInvert32 + 1 ]
		ifFalse: [ aNumber ].
	1 to: 4 do: [ :i | stream nextPut: (numberToSave digitAt: i) ]
]

{
	#category : #writting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBinaryReaderWriter>>writeUInt: aNumber [
	1 to: 4 do: [ :i | stream nextPut: (aNumber digitAt: i) ]
]
