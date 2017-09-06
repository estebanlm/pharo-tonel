"
SUnit tests for MemoryFileSystem
"
Class {
	#name : #MemoryFileSystemTest,
	#superclass : #FileSystemTest,
	#category : #FileSystem-Tests-Memory,
	#timestamp : 'TorstenBergmann 1/31/2014 11:48'
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:42'
}
MemoryFileSystemTest>>createFileSystem [
	^ FileSystem memory
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
MemoryFileSystemTest>>testEqual [
	| other |
	other := self createFileSystem.
	self deny: filesystem = other
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
MemoryFileSystemTest>>testIsMemoryFileSystem [
	self assert: filesystem isMemoryFileSystem.
	
]
