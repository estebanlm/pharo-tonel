"
I am a concrete subclass of AbstractBinaryFileStream for normal files. Regardless the position of the file, I will make my operarions on my position and then return the file it's own position.

In addition to my superclass' API I provide the following methods.

stream upToEnd
""reads the full stream up to the end and returns the contents""
"
Class {
	#name : #BinaryFileStream,
	#superclass : #AbstractBinaryFileStream,
	#category : #Files-Streams,
	#timestamp : 'GuillermoPolito 6/5/2015 11:05'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>atEnd [

	^ self primAtEnd: handle
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>close [
	self closed
		ifTrue: [ ^ self ].
	File primClose: handle.
	self unregister.
	handle := nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>closed [
	^ handle isNil or: [ (self primSizeNoError: handle) isNil ]
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>finalize [

	^ self close
]

{
	#category : #flushing,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>flush [
	"When writing, this flushes the write buffer the stream uses to reduce
	the number of write() system calls it makes. This should generally be
	used before #sync, but on Windows they do the same thing."
	
	self primFlush: handle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>peek [
	"Answer what would be returned if the message next were sent to the receiver. If the receiver is at the end, answer nil.  "
	| next |
	self atEnd ifTrue: [^ nil].
	next := self next.
	self position: self position - 1.
	^ next
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>position [

	^ self primGetPosition: handle
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>position: aPosition [
	
	self primSetPosition: handle to: aPosition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>primAtEnd: id [
	"Answer true if the file position is at the end of the file."

	<primitive: 'primitiveFileAtEnd' module: 'FilePlugin'>
	self primitiveFailed

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>primCloseNoError: id [
	"Close this file. Don't raise an error if the primitive fails."

	<primitive: 'primitiveFileClose' module: 'FilePlugin'>

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>primGetPosition: id [
	"Get this files current position."

	<primitive: 'primitiveFileGetPosition' module: 'FilePlugin'>
	self primitiveFailed

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>primSetPosition: id to: anInteger [
	"Set this file to the given position."

	<primitive: 'primitiveFileSetPosition' module: 'FilePlugin'>
	self primitiveFailed

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>primSize: id [
	"Answer the size of this file."

	<primitive: 'primitiveFileSize' module: 'FilePlugin'>
	self primitiveFailed

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>primSizeNoError: id [
	"Answer the size of this file. Answer nil if the primitive fails; this indicates that the file handle has become stale."

	<primitive: 'primitiveFileSize' module: 'FilePlugin'>
	^ nil

]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>register [

	File register: self
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>reset [
	self position: 0
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>setToEnd [
	
	self position: self size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>size [

	^ self primSize: handle
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>skip: n [
	"Set the character position to n characters from the current position."
	self position: self position + n
]

{
	#category : #flushing,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>sync	 [
	"When writing, this syncs any written/flushed data still in the kernel
	file system buffers to disk. This should generally be used after #flush,
	but on Windows they do the same thing."

	self primSync: handle
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>truncate [

	self truncate: 0
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>truncate: pos [
	"Truncate to this position"

	^self primTruncate: handle to: pos
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>unregister [

	File unregister: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
BinaryFileStream>>upToEnd [
	"Answer a subcollection from the current access position through the last element of the receiver."

	^ByteArray streamContents: [ :newStream |
		| next |
		[ (next := self next) isNil ] whileFalse: [
			newStream nextPut: next ] ]
]
