"
I'm a specific store for memory file system
"
Class {
	#name : #MemoryStore,
	#superclass : #FileSystemStore,
	#instVars : [
		'root'
	],
	#category : #FileSystem-Memory,
	#timestamp : '<historical>'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore class>>delimiter [
	^ $/
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore class>>isCaseSensitive [
	^ true
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore class>>separator  [
	^ $:
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basenameFromEntry: aMemoryFileSystemEntry [
	^ aMemoryFileSystemEntry basename
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicCreationTimeOf: aMemoryFileSystemEntry [
	"Returns the creation date of aMemoryFileSystemEntry"
	^ aMemoryFileSystemEntry creationTime
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicEntry: entry nodesDo: aBlock [
	entry fileEntriesDo: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicEntry: directoryEntry path: aPath nodesDo: aBlock [
	directoryEntry fileEntriesDo: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicIsDirectory: aMemoryFileSystemEntry [
	^ aMemoryFileSystemEntry isDirectory
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicIsFile: aMemoryFileSystemEntry [
	^ aMemoryFileSystemEntry isFile
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicIsSymlink: aNode [
	^false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicModificationTimeOf: aMemoryFileSystemEntry [
	"Return the basic modification time of aMemoryFileSystemEntry"
	^ aMemoryFileSystemEntry modificationTime
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicOpen: path writable: aBoolean [
	^ self
		nodeAt: path
		ifPresent: [ :aMemoryFileSystemEntry | aMemoryFileSystemEntry ]
		ifAbsent: [ 
			aBoolean
				ifFalse: [ self signalFileDoesNotExist: path ]
				ifTrue: [ self createFile: path ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicPosixPermissions: anEntry [
	^ 8r777
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>basicSizeOf: aMemoryFileSystemEntry [
	"Return the basic size of aMemoryFileSystemEntry"
	^ aMemoryFileSystemEntry fileSize
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>checkName: aString fixErrors: fixErrors [
	aString ifEmpty: [ self error: 'zero length file name' ].
	^ aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>copy: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock fileSystem: aFilesystem [
        | sourceNode destinationNode |

        sourceNode := self
                nodeAt: sourcePath
                ifPresent: [ :source | source ]
                ifAbsent: [ ^ absentBlock value].

        sourceNode isDirectory
                ifTrue: [ ^ absentBlock value ].

        destinationNode := self
                nodeAt: destinationPath parent
                ifPresent: [ :destination |  destination ]
                ifAbsent: [ ^ self signalDirectoryDoesNotExist: destinationPath parent ].

        destinationNode isFile
                ifTrue: [ self signalDirectoryDoesNotExist: destinationPath parent ].

        (destinationNode fileEntriesIncludes: destinationPath basename)
                ifTrue: [ "cannot overwrite existing file"^ presentBlock value ].

        destinationNode
                fileEntryAt: destinationPath basename
                put: (sourceNode copy
                                        basename: destinationPath basename;
                                        yourself)

]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>createDirectory: path [
	| parent |
	parent := path parent.
	^ self
		nodeAt: parent
		ifPresent: [ :entry | 
			entry
				fileEntryAt: path basename
				ifPresent: [ :node | 
					node isDirectory
						ifTrue: [ self signalDirectoryExists: path ]
						ifFalse: [ self signalFileExists: path ] ].
			entry ensureCreateDirectory: path basename  ]
		ifAbsent: [ self signalDirectoryDoesNotExist: parent ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>createFile: aPath [
	^ self
		nodeAt: aPath parent
		ifPresent: [ :entry | 
			entry isDirectory
				ifTrue: [ entry ensureCreateFile: aPath basename ]]
		ifAbsent: [ self signalDirectoryDoesNotExist: aPath parent ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>delete: path [
	self 
		nodeAt: path parent
		ifPresent: [ :dict | 
			dict fileEntryRemove: path basename ifAbsent: [ FileDoesNotExist signalWith: path ]] 
		ifAbsent: [ DirectoryDoesNotExist signalWith: path parent ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>forReferencePrintOn: aStream [
	aStream nextPutAll: 'memory://'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>handleClass [
	^ MemoryHandle 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>initialize  [
	root := MemoryFileSystemDirectory new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>isMemoryFileSystem [
	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>nodeAt: aPath ifPresent: presentBlock ifAbsent: absentBlock [
	| current |
	current := self root.
	aPath do: [ :segment | 
		current isDirectory
			ifTrue: [ current := current fileEntryAt: segment ifAbsent: [ ^ absentBlock value ]]
			ifFalse: [ ^ absentBlock value ]].
	^ presentBlock value: current
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>openFileStream: path writable: isWriteStream [
	| entry |
	entry := self basicOpen: path writable: isWriteStream.
	^ isWriteStream 
		ifTrue: [ entry writeStream ]
		ifFalse: [ entry readStream ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>rename: sourcePath to: destinationPath [
	| sourceEntry destinationParentEntry newName |
	
	sourceEntry := self nodeAt: sourcePath.
	newName := destinationPath basename.
	
	destinationParentEntry := self nodeAt: destinationPath parent.
	
	destinationParentEntry isDirectory
		ifFalse: [ Error signal: 'Copy destination has to be a directory' ].
	destinationParentEntry 
		fileEntryAt: newName
		ifPresent: [ Error signal: 'Destination file exists already' ].
		
	destinationParentEntry 
		fileEntryAt: newName
		put: sourceEntry.
	sourceEntry basename: newName.
	
	
	(self nodeAt: sourcePath parent)
		fileEntryRemove: sourcePath basename 
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>replaceFile: path in: aBlock [
	^ self
		nodeAt: path parent
		ifPresent: [ :entry | | old new |
			entry isDirectory
				ifFalse: [ self signalFileDoesNotExist: path ].
			old := entry fileEntryAt: path basename ifAbsent: [ self signalFileDoesNotExist: path ].
			new := aBlock value: old.
			entry fileEntryAt: path basename put: new ]
		ifAbsent: [ self signalFileDoesNotExist: path ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryStore>>root [
	^ root
]
