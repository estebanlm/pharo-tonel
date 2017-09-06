"
I am an abstract superclass for file handle implementations. I provide a uniform interface that streams can use for read and write operations on a file regardless of the filesystem. I encapsulate the actual IO primitives.
"
Class {
	#name : #FileSystemHandle,
	#superclass : #Object,
	#instVars : [
		'reference',
		'writable'
	],
	#classVars : [
		'Primitives'
	],
	#category : #FileSystem-Core-Kernel,
	#timestamp : 'cwp 11/18/2009 11:11'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle class>>on: aReference writable: aBoolean [
	^ self new setReference: aReference writable: aBoolean
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle class>>open: aReference writable: aBoolean [
	^ (self on: aReference writable: aBoolean) open
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>at: index [
	| buffer |
	buffer := ByteArray new: 1.
	self at: index read: buffer startingAt: 1 count: 1.
	^ buffer at: 1
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>at: index put: anObject [
	| buffer |
	buffer := ByteArray with: (anObject isCharacter
		ifTrue: [ anObject codePoint ]
		ifFalse: [ anObject ]).
	self at: index write: buffer startingAt: 1 count: 1.
	
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>at: offset read: buffer startingAt: start count: count [
	self subclassResponsibility
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>at: offset write: buffer startingAt: start count: count [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>basicOpen [
	"get the raw stream description from the filesystem's store"
	^ self fileSystem 
		openStreamDescription: reference path
		writable: writable
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>close [
	self subclassResponsibility
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>ensureClosed [
	reference exists ifTrue: [self close]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>fileSystem [
	^ reference fileSystem 
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>flush [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>fullName [
	^ reference fullName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>isOpen [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>isWritable [
	^ writable
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>open [
	self subclassResponsibility
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>readStream [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>reference [
	^ reference
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>reopen [
	self close.
	self open
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>setReference: aReference writable: aBoolean [
	reference := aReference resolve.
	writable := aBoolean
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>sync [
	self subclassResponsibility
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>truncateTo: anInteger [
	self subclassResponsibility
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemHandle>>writeStream [
	self subclassResponsibility
]
