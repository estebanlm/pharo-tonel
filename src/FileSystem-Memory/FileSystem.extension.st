Extension {
	#name : #FileSystem
}

{
	#category : #'*FileSystem-Memory',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem>>isMemoryFileSystem [
	^ store isMemoryFileSystem
]

{
	#category : #'*filesystem-memory',
	#timestamp : ' 8/31/2017 07:16:32'
}
FileSystem class>>memory [
	^ self store: (MemoryStore new)
]
