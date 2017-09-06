"
I represent a sequential binary File. I provide the minimum operations to:

- move the cursor fo the file
- reading
- writing

!Examples of usage

""Creating a file""
file := File named: 'asd.txt' asFileReference fullName.

""Opening / closing it""
file open.
file openForAppend.
file close.

""Accessing the file properties""
file size.
file position.
file position: 0.
file seekAbsolute: 10.
file seekRelative: 10.
file atEnd.

""Writing""
file nextPutAll: 'sdd'.

""Reading""
file next: 2.

""Buffered write""
file next: 2 putAll: 'abc' startingAt: 2.

""Buffered read""
buffer := ByteArray new: 5.
file readInto: buffer startingAt: 1 count: 5.
buffer asString.
"
Class {
	#name : #File,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classVars : [
		'Registry'
	],
	#category : #Files-Core,
	#timestamp : 'GuillermoPolito 6/5/2015 11:08'
}

{
	#category : #'file creation',
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>named: fileName [
	"Open a file with the given name for reading and writing. If the name has no directory part, then the file will be created in the default directory. If the file already exists, its prior contents may be modified or replaced, but the file will not be truncated on close."

	^ self new named: fileName
]

{
	#category : #'file creation',
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>openAndTruncateForWriteFileNamed: aName [

	^ (self named: aName)
		delete;
		openForWrite
]

{
	#category : #'file creation',
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>openForReadFileNamed: aName [

	^ (self named: aName)
		openForRead
]

{
	#category : #'file creation',
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>openForWriteFileNamed: aName [

	^ (self named: aName) openForWrite
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>primClose: id [
	"Close this file."

	<primitive: 'primitiveFileClose' module: 'FilePlugin'>
	self primitiveFailed
]

{
	#category : #registry,
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>register: anObject [
	^self registry add: anObject
]

{
	#category : #registry,
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>registry [
	^Registry ifNil: [Registry := WeakRegistry new]

]

{
	#category : #registry,
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>retryWithGC: execBlock until: testBlock forFileNamed: fullName [
	"Some platforms, like Windows, will fail if we try to open a file twice.
	However, sometimes it may happen that a file was unreferenced and should be garbage-collected.
	The purpose of this method is to try to open the file, and if it fails, launch a garbage collection to try to close the unreferenced files.
	Then we will retry again to open the file"

	| blockValue foundIt |
	blockValue := execBlock value.
	(testBlock value: blockValue) ifTrue:[^blockValue].

	"Optimization: See if we have a file with the given name. Not really needed"
	foundIt := self registry keys "hold on strongly for now" 
		anySatisfy:[:file| file name sameAs: fullName].
	foundIt ifFalse:[^blockValue].

	Smalltalk garbageCollectMost.
	blockValue := execBlock value.
	(testBlock value: blockValue) ifTrue:[^blockValue].
	Smalltalk garbageCollect.
	^execBlock value.
]

{
	#category : #registry,
	#timestamp : ' 8/31/2017 07:16:12'
}
File class>>unregister: anObject [
	^self registry remove: anObject ifAbsent:[]
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>basicOpenForWrite: writeMode  [
	"Open the file with the given name. If writeMode is true, allow writing, otherwise open the file in read-only mode."
	^ self class
		retryWithGC: [ self primOpen: name writable: writeMode ]
		until:[ :id | id notNil ] 
		forFileNamed: name
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>delete [
	"We retries with GC because in some platforms open files cannot be open"
	self class
		retryWithGC: [ self primDelete: name ]
		until: [ :result | result notNil ]
		forFileNamed: name.
	self exists
		ifTrue: [ (CannotDeleteFileException new messageText: 'Could not delete file ' , name,'. Check the file is not open.') signal ].
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>exists [

	| handle |
	"We open it for read. If the returned handle is nil, the file could not be opened"
	handle := self basicOpenForWrite: false.
	handle ifNil: [^ false].
	self class primClose: handle.
	^ true
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>name [

	^ name
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>named: fileName [

	name := fileName
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>openForAppend [

	| stream |
	stream := self openForWrite: true.
	^ stream setToEnd; yourself
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>openForRead [

	^ self openForWrite: false
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>openForWrite [

	^ self openForWrite: true
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>openForWrite: writeMode  [
	"Open the file with the given name. If writeMode is true, allow writing, otherwise open the file in read-only mode."
	| fileHandle |
	fileHandle := self basicOpenForWrite: writeMode.
	fileHandle ifNil: [ FileException signal: 'cannot open file: ', name ].
	^ (BinaryFileStream handle: fileHandle file: self forWrite: writeMode)
		register;
		yourself
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>primDelete: aFileName [
	"Delete the file of the given name. 
	Return self if the primitive succeeds, nil otherwise."

	<primitive: 'primitiveFileDelete' module: 'FilePlugin'>
	^ nil
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>primOpen: fileName writable: writableFlag [
	"Open a file of the given name, and return the file ID obtained.
	If writableFlag is true, then
		if there is none with this name, then create one
		else prepare to overwrite the existing from the beginning
	otherwise
		if the file exists, open it read-only
		else return nil"

	<primitive: 'primitiveFileOpen' module: 'FilePlugin'>
	^ nil

]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>readStream [
	
	^ self openForRead
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>readStreamDo: aBlock [
	| stream |
	stream := self readStream.
	^ [ aBlock value: stream ]
		ensure: [ stream close ]
]

{
	#category : #registry,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>unregister [
	^self class unregister: self
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>writeStream [

	^ self openForWrite
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:12'
}
File>>writeStreamDo: aBlock [
	| stream |
	stream := self writeStream.
	^ [ aBlock value: stream ]
		ensure: [ stream close ]
]
