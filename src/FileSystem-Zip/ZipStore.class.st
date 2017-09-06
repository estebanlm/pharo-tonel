"
I'm a specific store for Zip file systems
"
Class {
	#name : #ZipStore,
	#superclass : #MemoryStore,
	#instVars : [
		'reference'
	],
	#category : #FileSystem-Zip,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipStore class>>reference: aReference [
	^ self basicNew
		initializeWithReference: aReference
		yourself
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipStore>>close [
	| archive fs stream |
	archive := ZipArchive new.
	fs := FileSystem store: self.
	fs root allChildren do: 
		[ :each | 
		each isFile ifTrue: 
			[ each readStreamDo: 
				[ :output | 
				archive addString: output contents as: each path printString ] ] ].
	archive
		writeTo: (stream := WriteStream on: ByteArray new);
		close.
	self reference writeStreamDo: 
		[ :output | output nextPutAll: stream contents ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipStore>>forReferencePrintOn: aStream [
	aStream nextPutAll: 'zip://'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipStore>>initialize [
	super initialize.
	root := ZipFileSystemDirectory new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipStore>>initializeWithReference: aReference [
	self initialize.
	reference := aReference
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipStore>>open [
	| archive |
	self reference exists
		ifFalse: [ ^ self ].
	archive := ZipArchive new.
	self reference
		binaryReadStreamDo: [ :input | 
			archive readFrom: input contents readStream.
			archive members
				do: [ :member | 
					| path |
					path := self pathFromMember: member.
					member isDirectory
						ifTrue: [ self ensureCreateDirectory: path ]
						ifFalse: [ 
							self ensureCreateDirectory: path parent.
							(self createFile: path) member: member ] ] ].
	^ self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipStore>>pathFromMember: anArchiveMember [
	| path |
	path := Path from: anArchiveMember fileName.
	^ path basename isEmpty
		ifTrue: [ path parent ]
		ifFalse: [ path ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:12'
}
ZipStore>>reference [
	^ reference
]
