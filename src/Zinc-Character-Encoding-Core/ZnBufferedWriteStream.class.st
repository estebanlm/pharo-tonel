"
I am ZnBufferedWriteStream.
I wrap a write stream and add buffering.

Make sure to always send me #flush or #close when you're done,
otherwise the last buffer might not yet have been written.
My class side's #on:do: helps to ensure this.

I can wrap both binary or character streams and act accordingly.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnBufferedWriteStream,
	#superclass : #Object,
	#instVars : [
		'stream',
		'buffer',
		'position'
	],
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream class>>on: writeStream [
	^ self basicNew
		on: writeStream;
		yourself
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream class>>on: writeStream do: block [
	"Execute block with as argument a ZnBufferedWriteStream on writeStream,
	making sure #flush is called at the end. Return the value of block."
	
	| bufferedWriteStream result |
	bufferedWriteStream := self on: writeStream.
	result := block value: bufferedWriteStream.
	bufferedWriteStream flush.
	^ result
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>buffer [
	buffer isNil 
		ifTrue: [ self sizeBuffer: self defaultBufferSize ].
	^ buffer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>bufferFreeSize [
	^ self bufferSize - position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>bufferSize [
	^ buffer isNil 
		ifTrue: [ self defaultBufferSize ]
		ifFalse: [ buffer size ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>close [
	self flushBuffer.
	stream close
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>cr [
	self nextPut: Character cr
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>crlf [
	self cr; lf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>defaultBufferSize [
	^ 2 raisedToInteger: 16
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>finish [
	self flushBuffer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>flush [
	self flushBuffer.
	stream flush
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>flushBuffer [
	position = 0 ifTrue: [ ^ self ].
	position = self bufferSize
		ifTrue: [
			stream nextPutAll: buffer ]
		ifFalse: [
			(stream respondsTo: #next:putAll:startingAt:)
				ifTrue: [ stream next: position putAll: buffer startingAt: 1 ]
				ifFalse: [ stream nextPutAll: (buffer copyFrom: 1 to: position) ] ].
	position := 0
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>flushBufferIfFull [
	position = self bufferSize 
		ifTrue: [ self flushBuffer ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>lf [
	self nextPut: Character lf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>next: count putAll: collection [
	"Write count elements from collection"
	
	self 
		next: count 
		putAll: collection 
		startingAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>next: count putAll: collection startingAt: offset [
	"Write count elements from collection starting at offset."
	
	self flushBufferIfFull.
	count <= self bufferFreeSize
		ifTrue: [
			self buffer replaceFrom: position + 1 to: position + count with: collection startingAt: offset.
			position := position + count ]
		ifFalse: [
			self flushBuffer.
			count > (self bufferSize / 2)
				ifTrue: [ stream next: count putAll: collection startingAt: offset ]
				ifFalse: [ self next: count putAll: collection startingAt: offset ] ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>nextPut: object [
	self flushBufferIfFull.
	position := position + 1.
	self buffer at: position put: object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>nextPutAll: collection [
	"Write a collection"
	
	self 
		next: collection size 
		putAll: collection 
		startingAt: 1
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>on: writeStream [
	stream := writeStream.
	position := 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>print: object [
	object printOn: self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>printOn: aStream [
	aStream 
		nextPutAll: 'a '; 
		nextPutAll: self class name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>sizeBuffer: size [
	buffer := (stream isBinary ifTrue: [ ByteArray ] ifFalse: [ String ]) new: size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>space [
	self nextPut: Character space
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnBufferedWriteStream>>tab [
	self nextPut: Character tab
]
