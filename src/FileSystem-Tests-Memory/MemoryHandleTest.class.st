"
SUnit tests for memory handles, the tests may be found in superclass
"
Class {
	#name : #MemoryHandleTest,
	#superclass : #FileSystemHandleTest,
	#category : #FileSystem-Tests-Memory,
	#timestamp : 'TorstenBergmann 1/31/2014 11:49'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
MemoryHandleTest>>createFileSystem [
	^ FileSystem memory
]
