"
ZipStringMember instances are used to represent files that are going to be written to a ZipArchive.
Their data comes from in-image strings, though.
"
Class {
	#name : #ZipStringMember,
	#superclass : #ZipArchiveMember,
	#instVars : [
		'contents',
		'stream'
	],
	#category : #Compression-Archives,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipStringMember class>>newFrom: aString named: aFileName [
	^(self new) contents: aString; localFileName: aFileName; yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipStringMember>>contents [
	^contents
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipStringMember>>contents: aString [
	contents := aString.
	compressedSize := uncompressedSize := aString size.
	"set the file date to now"
	self modifiedAt: DateAndTime now.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipStringMember>>initialize [
	super initialize.
	self contents: ''.
	compressionMethod := desiredCompressionMethod := CompressionStored.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipStringMember>>readRawChunk: n [
	^stream next: n
]

{
	#category : #private-writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZipStringMember>>rewindData [
	super rewindData.
	stream := contents readStream.
	readDataRemaining := contents size
]
