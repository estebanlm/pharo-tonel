Extension {
	#name : #FileStream
}

{
	#category : #'*FileSystem-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileStream class>>onHandle: aFileSystemHandle [
	^ self concreteStream new
		open: aFileSystemHandle fullName
		forWrite: aFileSystemHandle isWritable
]
