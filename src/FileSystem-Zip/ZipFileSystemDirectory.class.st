"
I represent a zip file system entry for a directory. Together with ZipFileSystemFile I take care of lazily accessing archive members.
"
Class {
	#name : #ZipFileSystemDirectory,
	#superclass : #MemoryFileSystemDirectory,
	#category : #FileSystem-Zip,
	#timestamp : 'MaxLeske 9/27/2014 07:52'
}

{
	#category : #creation,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipFileSystemDirectory>>ensureCreateFile: aFileName [
	^ self 
		fileEntryAt: aFileName 
		put: (ZipFileSystemFile named: aFileName)
]
