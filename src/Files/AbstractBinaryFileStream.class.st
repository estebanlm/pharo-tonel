"
Provides a simple, platform-independent, file stream. I am 
   - bynary
   - not buffered
   - provide no encoding/conversions

!Examples of usage

""Creating a file""
stream := (File named: 'asd.txt' asFileReference fullName) readStream.

""Accessing the stream properties""
stream position.
stream atEnd.

""Writing""
stream nextPut: 17.
stream nextPutAll: 'sdd'.

""Reading""
stream next.
stream next: 2.

""Skipping""
stream skip: 2. 

""reading up to something""
stream upTo: 23.
stream upToAnyOf: #[ 13 30 ].

""peeking""
stream peek.
"
Class {
	#name : #AbstractBinaryFileStream,
	#superclass : #Stream,
	#instVars : [
		'file',
		'handle',
		'forWrite'
	],
	#category : #Files-Streams,
	#timestamp : 'GuillermoPolito 6/5/2015 11:05'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream class>>handle: aCollection file: aFile forWrite: aTrue [
	
	^ self basicNew
		handle: aCollection file: aFile forWrite: aTrue;
		yourself
]

{
	#category : #'character writing',
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>cr [
	
	self nextPut: Character cr asInteger
]

{
	#category : #'character writing',
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>crlf [
	
	self nextPutAll: String crlf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>file [
	^ file
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>file: aFile  [
	
	file := aFile
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>handle: aCollection file: aFile forWrite: aBoolean [
	
	handle := aCollection.
	file := aFile.
	forWrite := aBoolean
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>isBinary [
	^ true
]

{
	#category : #'character writing',
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>lf [

	self nextPut: Character lf asInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>name [

	^ file name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>next [
	"Answer the next byte from this file, or nil if at the end of the file."

	^ (self next: 1) ifEmpty: [ nil ] ifNotEmpty: [ :col | col first ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>next: n [
	"Return a string with the next n characters of the filestream in it."

	^ self next: n into: (ByteArray new: n)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>next: n into: aBuffer [
	"Return a string with the next n characters of the filestream in it."
	| readBuffer read |
	readBuffer := aBuffer.
	read := self primRead: handle into: readBuffer startingAt: 1 count: n.
	^read = n 
		ifTrue: [ readBuffer ]
		ifFalse: [ readBuffer copyFrom: 1 to: read ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>next: amount putAll: aByteArray [

	forWrite ifFalse: [^ self error: 'Cannot write a read-only file'].
	self primWrite: handle from: aByteArray startingAt: 1 count: amount.
	^ aByteArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>nextInto: aBuffer [
	"Return a string with the next n characters of the filestream in it."

	^ self next: aBuffer size into: aBuffer
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>nextPut: anInteger [

	^ self nextPutAll: (ByteArray with: anInteger asInteger)
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>nextPutAll: aByteArray [

	forWrite ifFalse: [^ self error: 'Cannot write a read-only file'].
	
	self primWrite: handle from: aByteArray startingAt: 1 count: aByteArray basicSize.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>peek [
	"Answer what would be returned if the message next were sent to the receiver. If the receiver is at the end, answer nil.  "
	self subclassResponsibility
]

{
	#category : #positioning,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>position [

	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>primFlush: id [
	"On Unix, the FilePlugin uses stdio FILE* structs which maintain their
	own internal buffer to minimize write() syscalls. This flushes that buffer.
	On Windows this and primSync: do the same thing."

	<primitive: 'primitiveFileFlush' module: 'FilePlugin'>
	
	"We can't ignore fflush() failing, because it can fail for any of the
	reasons write() can."
	self primitiveFailed
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>primRead: id into: byteArray startingAt: startIndex count: count [
	"Read up to count bytes of data from this file into the given string or byte array starting at the given index. Answer the number of bytes actually read."

	<primitive: 'primitiveFileRead' module: 'FilePlugin'>
	self closed ifTrue: [^ self error: 'File is closed'].
	self error: 'File read failed'.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>primSync: id [
	"On Unix, this syncs any written or flushed data still in the kernel file
	system buffers to disk. On Windows this and primFlush: do the same thing"

	<primitive: 'primitiveFileSync' module: 'FilePlugin'>

	"fsync() failing cannot be ignored"
	self primitiveFailed
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>primTruncate: id to: anInteger [
	"Truncate this file to the given position."

	<primitive: 'primitiveFileTruncate' module: 'FilePlugin'>
	self primitiveFailed

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>primWrite: id from: stringOrByteArray startingAt: startIndex count: count [
	"Write count bytes onto this file from the given string or byte array starting at the given index. Answer the number of bytes written."

	<primitive: 'primitiveFileWrite' module: 'FilePlugin'>
	(FileWriteError fileName: self name)
		signal: (self closed
			ifTrue: [ 'File ', self name, ' is closed' ]
			ifFalse: [ 'File ', self name, ' write failed' ])
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>printOn: aStream [
	"Put a printed version of the receiver onto aStream."

	aStream
		nextPutAll: self class name;
		nextPutAll: ': ';
		print: file name
]

{
	#category : #positioning,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>skip: n [
	"Set the character position to n characters from the current position.
	Error if not enough characters left in the file.
	By default we read n characters and we avoid reading the output"
	self next: n
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>upTo: delim [

	^ self upToAnyOf: (ByteArray with: delim)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:12'
}
AbstractBinaryFileStream>>upToAnyOf: delimiters [

	^ ByteArray new: 1000 streamContents: [ :stream | | ch |
		[ (ch := self next) isNil or: [ delimiters includes: ch] ] 
			whileFalse: [ stream nextPut: ch ] ]
]
