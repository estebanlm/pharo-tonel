"
I represent a zip file system entry for a file. Together with ZipFileSystemDirectory I take care of lazily accessing archive members.
"
Class {
	#name : #ZipFileSystemFile,
	#superclass : #MemoryFileSystemFile,
	#instVars : [
		'member'
	],
	#category : #FileSystem-Zip,
	#timestamp : 'MaxLeske 9/27/2014 07:52'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipFileSystemFile>>bytes [
	| uncompressed |
	uncompressed := self readFromMember.
	self updateSize: uncompressed size.
	^ uncompressed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipFileSystemFile>>member [
	^ member
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipFileSystemFile>>member: aZipArchiveMember [
	member := aZipArchiveMember
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipFileSystemFile>>readFromMember [
	^ ByteArray 
		new: self member uncompressedSize
		streamContents: [ :stream |		
			self member extractTo: stream ]
]
