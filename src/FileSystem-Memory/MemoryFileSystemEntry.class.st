"
I am an abstract file system entry for a memory file system.
My subclasses should specialize on the kind of file they are.
"
Class {
	#name : #MemoryFileSystemEntry,
	#superclass : #Object,
	#instVars : [
		'creationTime',
		'modificationTime',
		'basename'
	],
	#category : #FileSystem-Memory,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry class>>named: aFileName [
	^ self new
		basename: aFileName;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>basename [
	^ basename
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>basename: aString [
	basename := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>creationTime [
	
	^ creationTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>fileSize [
	self subclassResponsibility 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>initialize  [
	creationTime := modificationTime := DateAndTime now.
	super initialize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>isDirectory [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>isFile [
	^ self isDirectory not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>modificationTime [
	
	^ modificationTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>modificationTime: anObject [
	
	modificationTime := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemEntry>>modified [
	modificationTime := DateAndTime now.
]
