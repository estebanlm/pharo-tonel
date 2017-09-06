"
I am an abstract superclass for store implementations. My subclasses provide access to the actual data storage of a particular kind of filesystem. 

The file system can be accessed via
	FileSystem disk 
	FileSystem memory
	
My associated filesystem can be accessed as follows:
      DiskStore currentFileSystem
"
Class {
	#name : #FileSystemStore,
	#superclass : #Object,
	#category : #FileSystem-Core-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore class>>delimiter [
	self shouldBeImplemented 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore class>>isCaseSensitive [
	^ self shouldBeImplemented
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore class>>separator [
	self shouldBeImplemented
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basenameFromEntry: aNode [
	"Used to extract the basename from the low-level representation (node / entry) from the store."
	self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicCreationTimeOf: aNode [
	"Used to decide whether the low-level representation (node / entry) from the store is a readable
	file or a directory whose contents can be listed."
	self subclassResponsibility 
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicEntry: directoryEntry path: aPath nodesDo: aBlock [
	self subclassResponsibility 
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicIsDirectory: aNode [
	"Used to decide whether the low-level representation (node / entry) from the store is a directory.
	This private message should only be called form within the store."
	self subclassResponsibility 
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicIsFile: aNode [
	"Used to decide whether the low-level representation (node / entry) from the store is a file.
	This private message should only be called form within the store."
	self subclassResponsibility 
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicIsSymlink: aNode [
	^self subclassResponsibility 
	
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicIsWritable: aNode [
	"Used to decide whether the low-level representation (node / entry) from the store is 
	a writable file or can be changed."
	self subclassResponsibility 
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicModificationTime: aNode [
	"Used to decide whether the low-level representation (node / entry) from the store is a readable
	file or a directory whose contents can be listed."
	self subclassResponsibility 
]

{
	#category : #'error signalling',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicOpen: aPath writable: aBoolean [
	"open the file at the given path and return an identifier"
	self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicPosixPermissions: aNode [
	"Used to get the posix permissions from a low-level filesystem entry / node"
	self subclassResponsibility 
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>basicSizeOf: aNode [
	"Used to get the size of the low-level representation (node / entry) "
	self subclassResponsibility 
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>checkName: aString fixErrors: fixErrors [
	^ self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>close [
	"Some kinds of filesystems need to open connections to external resources"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>copy: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock fileSystem: aFilesystem [

	| buffer out in |
	
	in := nil.
	out := nil.
	buffer := nil.
	[
		in := aFilesystem readStreamOn: sourcePath.
		in ifNil: [ ^ absentBlock value ].
		
		(self exists: destinationPath)
			ifTrue: [ "cannot overwrite destination"
				^ presentBlock value ].
			
		out := aFilesystem writeStreamOn: destinationPath.
		buffer := ByteArray new: 1024.
		
		[ in atEnd ]
			whileFalse: [ 
				buffer := in nextInto: buffer.
				out nextPutAll: buffer ]]
	ensure: [ 
		in ifNotNil: [ in close ].
		out ifNotNil: [ out close ]]
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>createDirectory: aPath [
	self subclassResponsibility 
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>creationTimeOf: aPath [
	"Return the date of creation of the File described by aPath"
	^ self 
		nodeAt: aPath 
		ifPresent: [ :entry | self basicCreationTimeOf: entry ] 
		ifAbsent: [ self signalFileDoesNotExist: aPath ].
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>defaultWorkingDirectory [
	^ Path root
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>delete: aPath [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>delimiter [
	^ self class delimiter
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>directoryAt: aPath ifAbsent: absentBlock directoryNodesDo: aBlock [
	^ self 
		directoryAt: aPath 
		ifAbsent: absentBlock 
		nodesDo: [ :entry|
			(self basicIsDirectory: entry) 
				ifTrue: [ aBlock value: entry ]].
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>directoryAt: aPath ifAbsent: absentBlock fileNodesDo: aBlock [
	^ self 
		directoryAt: aPath 
		ifAbsent: absentBlock 
		nodesDo: [ :entry|
			(self basicIsDirectory: entry) 
				ifFalse: [ aBlock value: entry ]].
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>directoryAt: aPath ifAbsent: absentBlock nodesDo: aBlock [
	^ self
		nodeAt: aPath
		ifPresent: [ :entry | 
			(self basicIsDirectory: entry)
				ifTrue: [ self basicEntry: entry path: aPath nodesDo: aBlock ]
				ifFalse: [ DirectoryDoesNotExist signalWith: aPath ] ]
		ifAbsent: absentBlock
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>ensureCreateDirectory: aPath [
	(self isDirectory: aPath) ifTrue: [ ^ self ].
	self ensureCreateDirectory: aPath parent.
	self createDirectory: aPath
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>entryFromNode: aNode fileSystem: aFilesystem path: aPath [
	^ FileSystemDirectoryEntry
		fileSystem: aFilesystem
		path: aPath
		creation: (self basicCreationTimeOf: aNode)
		modification:(self basicModificationTimeOf: aNode)
		isDir: (self basicIsDirectory: aNode)
		size: (self basicSizeOf: aNode)
		posixPermissions: (self basicPosixPermissions: aNode)
		isSymlink: (self basicIsSymlink: aNode)
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>entryFromNode: node path: path for: aFileystem [
	| entryPath |
	entryPath := path / (self basenameFromEntry: node).
	^ self entryFromNode: node fileSystem: aFileystem path: entryPath
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>exists: aPath [
	self 
		nodeAt: aPath 
		ifPresent: [ :entry | ^ true ] 
		ifAbsent: [ ^ false ].
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>filename: aByteString matches: aByteString2 [
	^ aByteString = aByteString2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>isCaseSensitive [
	^ self class isCaseSensitive
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>isDirectory: aPath [
	aPath isRoot ifTrue: [ ^ true ].
	self 
		nodeAt: aPath 
		ifPresent: [ :entry | ^ self basicIsDirectory: entry ] 
		ifAbsent: [ ^ false ].
	
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>isFile: aPath [
	"slow solution for big directories! "
	^ self 
		nodeAt: aPath 
		ifPresent: [ :entry | ^ self basicIsFile: entry ] 
		ifAbsent: [ ^ false ]
	
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>isSymlink: aPath [
	aPath isRoot ifTrue: [ ^ true ].
	self 
		nodeAt: aPath 
		ifPresent: [ :entry | ^ self basicIsSymlink: entry ] 
		ifAbsent: [ ^ false ].
	
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>isWritable: aPath [
	self nodeAt: aPath 
		ifPresent: [ :entry | ^ self basicIsWritable: entry ] 
		ifAbsent: [ ^ false ].
	
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>mimeTypesAt: aPath [
	| mimeType |
	mimeType := ZnMimeType 
						forFilenameExtension: aPath extension 
						ifAbsent: [  ^ nil ].
	^ Array with: mimeType
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>modificationTimeOf: aPath [
	"Returns the last date of modification of the File described by aPath"
	^ self 
		nodeAt: aPath 
		ifPresent: [ :entry | self basicModificationTimeOf: entry ] 
		ifAbsent: [ self signalFileDoesNotExist: aPath ].
	
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>nodeAt: aPath [
	^ self 
		nodeAt: aPath 
		ifPresent: [ :node| node ]
		ifAbsent: [ NotFound signalFor: aPath in: self ]
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>nodeAt: aPath ifPresent: presentBlock ifAbsent: absentBlock [
	self subclassResponsibility 
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>open [
	"Some kinds of filesystems need to open connections to external resources"
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>openFileStream: path writable: writable [
	self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>pathFromString: aString [
	"Use the unix convention by default, since many filesystems are based on it."
	
	^ Path from: aString delimiter: self delimiter
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>permissions: aPath [
	self nodeAt: aPath 
		ifPresent: [ :entry | ^ FileSystemPermission posixPermissions: (self basicPosixPermissions: entry) ] 
		ifAbsent: [ ^ FileSystemPermission default ].
	
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>printPath: aPath on: out [
	"Use the unix convention by default, since it's the most common."
	
	aPath isAbsolute ifTrue: [ out nextPut: self delimiter ].
	^ aPath printOn: out delimiter: self delimiter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>rename: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock fileSystem: anFSFilesystem [

	| result |
	(self exists: destinationPath) ifTrue: [ ^ presentBlock value ].
	(self exists: sourcePath) ifFalse: [ ^ absentBlock value ].
	result := self rename: sourcePath to: destinationPath.
	result ifNil: [ self primitiveFailed ].
	^ self.
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>rename: sourcePath to: destinationPath [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>separator [
	^ self class separator
]

{
	#category : #'error signalling',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>signalDirectoryDoesNotExist: aPath [
	^ DirectoryDoesNotExist signalWith: aPath
]

{
	#category : #'error signalling',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>signalDirectoryExists: aPath [
	^ DirectoryExists signalWith: aPath
]

{
	#category : #'error signalling',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>signalFileDoesNotExist: aPath [
	^ FileDoesNotExist signalWith: aPath
]

{
	#category : #'error signalling',
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>signalFileExists: aPath [
	^ FileExists signalWith: aPath
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>sizeOf: aPath [
	"Return the size of the File described by aPath"
	^ self 
		nodeAt: aPath 
		ifPresent: [ :entry | self basicSizeOf: entry ] 
		ifAbsent: [ self signalFileDoesNotExist: aPath ]
	
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:22'
}
FileSystemStore>>stringFromPath: aPath [
	^ String streamContents: [ :out | 
		self printPath: aPath on: out ]
]
