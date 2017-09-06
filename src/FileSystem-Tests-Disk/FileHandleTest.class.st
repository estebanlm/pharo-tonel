"
SUnit tests for file handles, the tests may be found in superclass
"
Class {
	#name : #FileHandleTest,
	#superclass : #FileSystemHandleTest,
	#category : #FileSystem-Tests-Disk,
	#timestamp : 'TorstenBergmann 1/31/2014 11:49'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
FileHandleTest>>createFileSystem [
	^ FileSystem store: DiskStore activeClass createDefault
]
