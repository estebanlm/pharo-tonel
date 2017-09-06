"
I am ZnChunkedWriteStream, I wrap another write stream and add HTTP 1.1 chunked transfer encoding.

I write a chunk for each #nextPutAll: or #next:putAll:startingAt:
I should be wrapped in a ZnBufferedWriteStream for #next: to work.
When done, send #close or #finish to me.

Part of Zinc HTTP Components.

"
Class {
	#name : #ZnChunkedWriteStream,
	#superclass : #Object,
	#instVars : [
		'stream',
		'extraHeaders',
		'totalSize',
		'chunkCount'
	],
	#category : #Zinc-HTTP-Streaming,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream class>>on: writeStream [
	^ self new
		on: writeStream;
		yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>binary [
	stream binary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>chunkCount [
	^ chunkCount
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>close [
	self finish.
	stream close
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>crlf [
	stream nextPutAll: (self isBinary ifTrue: [ #[ 13 10 ] ] ifFalse: [ String crlf ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>extraHeaders [
	^ extraHeaders ifNil: [ extraHeaders := ZnHeaders new ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>finish [
	self writeChunkSize: 0.
	self crlf.
	extraHeaders ifNotNil: [ extraHeaders writeOn: stream ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>flush [
	stream flush
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>initialize [
	super initialize.
	totalSize := 0.
	chunkCount := 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>isBinary [
	^ stream isBinary

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>isStream [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>next: count putAll: collection [
	self 
		next: count 
		putAll: collection 
		startingAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>next: count putAll: collection startingAt: offset [
	self writeChunkSize: count.
	stream next: count putAll: collection startingAt: offset.
	self crlf.
	chunkCount := chunkCount + 1.
	totalSize := totalSize + count

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>nextPut: element [
	self error: 'Wrap me into a buffered stream, because each #nexPut: will create a new chunk'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>nextPutAll: collection [
	self 
		next: collection size
		putAll: collection
		startingAt: 1
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>on: writeStream [
	stream := writeStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>position [
	^ totalSize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnChunkedWriteStream>>writeChunkSize: size [
	stream nextPutAll: (self isBinary ifTrue: [ size printStringHex asByteArray ] ifFalse: [ size printStringHex ]).
	self crlf
]
