"
ZipNewFileMember instances are used to represent files that are going to be written to a ZipArchive.
Their data comes from external file streams.
"
Class {
	#name : #ZipNewFileMember,
	#superclass : #ZipArchiveMember,
	#instVars : [
		'externalFileName',
		'stream'
	],
	#category : #Compression-Archives,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipNewFileMember class>>newNamed: aFileName [
	^(self new) from: aFileName
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipNewFileMember>>close [
	stream ifNotNil:[stream close].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipNewFileMember>>from: aFileName [

	| entry |
	"Now get the size, attributes, and timestamps, and see if the file exists"
	stream := StandardFileStream readOnlyFileNamed: aFileName.
	self localFileName: (externalFileName := stream name).
	entry := stream directoryEntry.
	compressedSize := uncompressedSize := entry size.
	desiredCompressionMethod := compressedSize > 0 ifTrue: [ CompressionDeflated ] ifFalse: [ CompressionStored ].
	self flag: 'When we replace Files with FileSystem, the following line won''t have to jump throught hoops (FS returns aDateAndTime)'.
	self modifiedAt: entry modificationTime.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipNewFileMember>>initialize [
	super initialize.
	externalFileName := ''.
	compressionMethod := CompressionStored.
	self mapPermissionsFromUnix: DefaultFilePermissions.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipNewFileMember>>readRawChunk: n [
	^stream next: n
]

{
	#category : #private-writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipNewFileMember>>rewindData [
	super rewindData.
	readDataRemaining := stream size.
	stream position: 0.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipNewFileMember>>usesFileNamed: aFileName [
	"Do I require aFileName? That is, do I care if it's clobbered?"
	^externalFileName asFileReference = aFileName asFileReference
]
