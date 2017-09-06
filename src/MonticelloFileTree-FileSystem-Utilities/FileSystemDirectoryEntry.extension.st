Extension {
	#name : #FileSystemDirectoryEntry
}

{
	#category : #'*monticellofiletree-filesystem-utilities',
	#timestamp : ' 8/31/2017 07:16:59'
}
FileSystemDirectoryEntry>>name [
    ^ self basename
]

{
	#category : #'*monticellofiletree-filesystem-utilities',
	#timestamp : ' 8/31/2017 07:16:59'
}
FileSystemDirectoryEntry>>readStreamDo: aBlock [
    ^ reference readStreamDo: aBlock
]
