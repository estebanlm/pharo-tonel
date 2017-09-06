"
This is the abstract superclass for archive members, which are files or directories stored in archives.
"
Class {
	#name : #ArchiveMember,
	#superclass : #Object,
	#instVars : [
		'fileName',
		'isCorrupt'
	],
	#category : #Compression-Archives,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember class>>newDirectoryNamed: aString [
	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember class>>newFromFile: aFileName [
	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember class>>newFromString: aString [
	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>close [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>fileName [
	^fileName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>fileName: aName [
	fileName := aName
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>initialize [
	super initialize.
	fileName := ''.
	isCorrupt := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>isCorrupt [
	^isCorrupt ifNil: [ isCorrupt := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>isCorrupt: aBoolean [
	"Mark this member as being corrupt."
	isCorrupt := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>localFileName: aString [
	"Set my internal filename.
	Returns the (possibly new) filename"

	^fileName := aString copyReplaceAll: FileSystem disk delimiter asString with: UnixStore delimiter asString.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(;
		nextPutAll: self fileName;
		nextPut: $)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ArchiveMember>>usesFileNamed: aFileName [
	"Do I require aFileName? That is, do I care if it's clobbered?"
	^false
]
