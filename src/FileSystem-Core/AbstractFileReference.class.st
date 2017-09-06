"
I am an abstract superclass for FileLocator and FileReference. By implementing most of the methods on myself most code duplucation between the locator and the reference can be avoided
"
Class {
	#name : #AbstractFileReference,
	#superclass : #Object,
	#category : #FileSystem-Core-Public,
	#timestamp : '<historical>'
}

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>, extension [
	^ self resolve, extension
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>/ aString [
	"aString is either a file or path.  If aString is relative, it is appended to the receiver, if it is absolute, an instance of the receiver with the path is answered"

	^ self withPath: (self path resolvePath: (self fileSystem pathFromString: aString))
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>><= other [
	^ self path <= other path
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>absolutePath [
	"Returns the absolute path"
	
	^ self subclassResponsibility
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>allChildren [
	"Return all the files and folders recursively nested in the receiver"
	
	^ CollectVisitor breadthFirst: self resolve collect: [:entry | entry reference]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>allChildrenMatching: aPattern [
    "Return all the files and folders recursively nested in the receiver and matching the pattern, aPattern"
    
    ^ self allChildren select: [ :each |  aPattern match: each basename ]

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>allDirectories [
	"Return all the directories recursively nested in the receiver."
	^ (SelectVisitor breadthFirst: self resolve select: [:entry | entry isDirectory ])
		collect: [ :each| each reference ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>allDirectoriesMatching: aPattern [
    "Return all the directories recursively nested in the receiver."
    ^ (SelectVisitor 
			breadthFirst: self resolve 
			select: [:entry | entry isDirectory and: [ aPattern match: entry basename ] ])
        collect: [ :each | each reference ]

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>allEntries [
	^ CollectVisitor breadthFirst: self resolve
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>allFiles [
	"Return all the files (not directories) recursively nested in the receiver."
	^ (SelectVisitor breadthFirst: self resolve select: [:entry | entry isFile ])
		collect: [ :each| each reference ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>asAbsolute  [
	self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>asFileReference  [
	self subclassResponsibility 
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>asPathWith: anObject [
	^ self resolve asPathWith: anObject
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>asResolvedBy: anObject [
	^ anObject resolveReference: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>base [
	"Returns the base of the basename, i.e. /foo/gloops.taz base is 'gloops'"
	^ self fullPath base
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>basename [
	"Returns the basename, i.e. /foo/gloops.taz basename is 'gloops.taz'"
	^ self fullPath basename
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>basenameWithIndicator [
	"Returns the basename with the indicator appended, i.e. /foo/gloops.taz basenameWithIndicator is 'gloops.taz', whereras /foo basenameWithIndicator is 'foo/'" 
	^ self basename, self indicator   
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>basenameWithoutExtension [
	"Returns the basename, i.e. /foo/gloops.taz basenameWithoutExtension is 'gloops'"
	^ self fullPath basenameWithoutExtension
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>basenameWithoutExtension: anExtension [
	"Returns the basename without specified extension (if any)
	('/foo/gloops.taz' asFileReference basenameWithoutExtension: 'taz') = 'gloops'
	"
	^ self fullPath basenameWithoutExtension: anExtension
]

{
	#category : #streams-compatibility,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>binaryReadStream [
	^ self subclassResponsibility
]

{
	#category : #streams-compatibility,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>binaryReadStreamDo: aBlock [
	| stream |
	stream := self binaryReadStream.
	^ [ aBlock value: stream ] 
		ensure: [ stream close ]
]

{
	#category : #streams-compatibility,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>binaryReadStreamDo: doBlock ifAbsent: absentBlock [
	^ self isFile 
		ifTrue: [ self binaryReadStreamDo: doBlock ]
		ifFalse: absentBlock
]

{
	#category : #streams-compatibility,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>binaryReadStreamIfAbsent: absentBlock [
	^ self isFile
		ifTrue: [ self binaryReadStream ]
		ifFalse: absentBlock
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>canonicalize [
	"Answer the receiver with references to the current folder (.) and parent folder (..) removed"

	^ self withPath: self resolve path canonicalize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>childGeneratorBlock: doBlock matching: patterns [
	"
	FileSystem workingDirectory filesMatching: '*'
	FileSystem workingDirectory filesMatching: '*.image;*.changes'
	"
	
	| files reference|
	files := Set new.
	reference := self resolve.
	
	(patterns findTokens: ';', String crlf) do: [ :pattern | 
		doBlock value: reference value: [ :basename|
			(pattern match: basename)
				ifTrue: [ files add: (self / basename) ]]].
	
	^files asOrderedCollection
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>childNames [
	^ self children collect: #basename
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>children [
	"Answer an array containing references to the direct children of this reference."
	| reference |
	reference := self resolve.
	^ (reference fileSystem childNamesAt: reference path) 
		collect: [ :aName | self / aName ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>childrenMatching: patterns [
	"
	FileSystem disk workingDirectory childrenMatching: '*'
	FileSystem disk workingDirectory childrenMatching: '*.image;*.changes'
	"
	^ self 
		childGeneratorBlock: [:reference : aBlock| 
			reference fileSystem childNamesAt: reference path do: aBlock ]
		matching:  patterns 
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>contains: anObject [
	"Return true if anObject is in a subfolder of me"
	^ anObject isContainedBy: self resolve
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>containsPath: aPath [
	^ self fullPath containsPath: aPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>contents [
	self readStreamDo: [ :stream |
		^ stream contents ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>copyAllTo: aResolvable [
	"Performs a deep copy of the receiver, to a location specified by the argument. If the receiver is a file, the file will be copied; if a directory, the directory and its contents will be copied recursively. The argument must be a reference that doesn't exist; it will be created by the copy."
	
	CopyVisitor copy: self resolve asAbsolute to: aResolvable resolve
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>copyTo: aReference [
	^ self resolve copyTo: aReference resolve
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>copyWithPath: newPath [
	self subclassResponsibility
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>createDirectory [
	"Verifies that the directory does not exist and only creates if necessary. Do not remove files contained if they exist.If the parents does not exist return an exception"
	self parent exists ifFalse:[DirectoryDoesNotExist signalWith: self parent path].
	^ self resolve ensureCreateDirectory
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>createFile [
	"Create if necessary a file for the receiver. If the parent does not exist return an exception"
	self parent exists ifFalse:[DirectoryDoesNotExist signalWith: self parent path].
	self writeStream close.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>creationTime [
	^ self resolve creationTime 
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>delete [
	"Delete the receiver, does raise an error if it is not present."
	
	^ self resolve delete
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>deleteAll [
	"Delete this directory and all children of it, raise an error if the file does not exist."
	DeleteVisitor delete: self resolve
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>deleteAllChildren [
	"delete all children of the receiver, raise an error if the receiver does not exist"
	
	self children do: [:aReference | aReference deleteAll ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>deleteIfAbsent: aBlock [
	"Delete the receiver, when it does not exist evaluate the block"
	self resolve deleteIfAbsent: aBlock
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>directories [
	"Return all the directories (by opposition to files) contained in the receiver"

	| reference |
	reference := self resolve.
	^ (reference fileSystem directoryNamesAt: reference path) 
		collect: [ :aName | self withPath: self path / aName ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>directoriesMatching: patterns [
	"
	FileSystem disk workingDirectory directoriesMatching: '*'
	FileSystem disk workingDirectory directoriesMatching: 'package-cache'
	"
	^ self 
		childGeneratorBlock: [:reference : aBlock| 
			reference fileSystem directoryNamesAt: reference path do: aBlock ]
		matching:  patterns 
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>directoryNames [
	^ self directories collect: #basename
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>ensureCreateDirectory [
	"Verifies that the directory does not exist and only creates if necessary. Do not remove files contained if they exist.Creates the parents if needed"
	^ self resolve ensureCreateDirectory
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>ensureCreateFile [
	"Create if necessary a file for the receiver. If the parent does not exist creates it"
	self parent ensureCreateDirectory.
	self writeStream close.
	
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>ensureDelete [
	"Delete the file and does not raise exception if it does not exist contrary to delete"
	
	self deleteIfAbsent: [].
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>ensureDeleteAll [
	"Delete this directory and all children of it, and does not raise an error if the file does not exist."
	
	self exists ifFalse: [ ^ self  ].
	self deleteAll
	
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>ensureDeleteAllChildren [
	"delete all children of the receiver and does not raise an error if the receiver does not exist"
	
	self exists ifFalse: [ ^ self  ].
	self deleteAllChildren
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>entries [
	^ self resolve entries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>entry [
	^ self resolve entry
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>exists [
	"Return true if the file reference exist (e.g., if there is a file on the hard disk pointed by the file reference)
	
	E.g., (if you are on Unix or OSX)
	'/tmp/' asFileReference exists => true
	'/tmp/zorkbar' asFileReference exists => false
	"
	^ self resolve exists
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>extension [
	
	^ self fullPath extension.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>extensions [
	  "#('foo' 'foo.tar' 'foo.tar.gz' 'foo.1.tar' 'foo.1.tar.gz') collect: [:thing| thing extensions] => #(#() #('tar') #('tar' 'gz') #('1' 'tar') #('1' 'tar' 'gz'))"
	
        ^ self fullPath extensions
]

{
	#category : #ToDeprecate,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>fileIn [

	self readStreamDo: [ :stream | 
		CodeImporter evaluateFileStream: stream ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>fileNames [
	^ self files collect: #basename
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>fileSystem [
	^ self resolve fileSystem
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>files [
	"Return all the files (as opposed to folders) contained in the receiver"
	
	| reference |
	reference := self resolve.
	^ (reference fileSystem fileNamesAt: reference path) 
		collect: [ :aName | self withPath: self path / aName ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>filesMatching: patterns [
	"
	FileSystem disk workingDirectory filesMatching: '*'
	FileSystem disk workingDirectory filesMatching: '*.image;*.changes'
	"
	^ self 
		childGeneratorBlock: [:reference : aBlock| 
			reference fileSystem fileNamesAt: reference path do: aBlock ]
		matching:  patterns 
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>fullName [

	^ self resolve fullName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>fullNameWithIndicator [
	"Returns the basename with the indicator appended, i.e. /foo/gloops.taz basenameWithIndicator is '/foo/gloops.taz', whereras /foo basenameWithIndicator is '/foo/'" 
	^ self fullName, self indicator   
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>fullPath [
	"Returns the absolute path, better use absolutePath"
	
	^ self subclassResponsibility
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>glob: aBlock [
	^ SelectVisitor breadthFirst: self resolve select: aBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>hasChildren [
	^self resolve hasChildren
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>hasDirectories [
	^self resolve hasDirectories
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>hasFiles [
	^self resolve hasFiles
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>hash [
	"Hash is reimplemented because #= is reimplemented"
	^ self path  hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>humanReadableSize [
	^ self size humanReadableSIByteSize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>ifFile: fBlock ifDirectory: dBlock ifAbsent: aBlock [
	^ self isFile
		ifTrue: fBlock
		ifFalse: [
			self isDirectory
				ifTrue: dBlock
				ifFalse: aBlock ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>indicator [
	"Returns a string indicating the type of reference:
	- '?' for a non existing reference',
	- '/' for a directory,
	- the empty string for a file."
	"When this framework gets more complete, it is possible to extend this behavior with the following indicators (taken from unix ls utility):
	- '*' for a regular file that is executable
	- '@' for a symbolic link
	- '|' for FIFOs
	- '=' for sockets
	- '>' for doors"
	^ self exists
		ifTrue: [self isDirectory ifTrue: ['/'] ifFalse: ['']  ]
		ifFalse: ['?']
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isAbsolute  [
	self subclassResponsibility 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isChildOf: anObject [
	^ self parent = anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isContainedBy: anObject [
	"DoubleDispatch helper for #contains:"
	^ anObject containsReference: self resolve
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isDirectory [
	^ self resolve isDirectory
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isFile [
	^ self resolve isFile
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isReadable [
	^ self resolve isReadable
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isRelative  [
	self subclassResponsibility 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isRoot [
	^ self resolve isRoot
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>isWritable [
	^ self resolve isWritable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>item [
	^ self
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>makeRelative: anObject [
	^ anObject relativeToReference: self resolve
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>mimeTypes [
	^ self resolve mimeTypes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>modificationTime [
	^ self resolve modificationTime 
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>moveTo: aReference [
	"Move the receiver in the location passed as argument.
	
	(FileSystem disk workingDirectory / 'paf' ) ensureCreateFile.
	(FileSystem disk workingDirectory / 'fooFolder') ensureCreateDirectory. 
	(FileSystem disk workingDirectory / 'paf' ) moveTo: (FileSystem disk workingDirectory / 'fooFolder' / 'paf')
	"
	^ self resolve moveTo: aReference
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>nextVersion [
	^ self resolve nextVersion
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>openWritable: aBoolean [
	^ self resolve openWritable: aBoolean
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>parent [
	^ self withPath: self resolve path parent
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>parentUpTo: aParentDirName [
	^ self withPath: (self path parentUpTo: aParentDirName)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>pathSegments [
	^ self fullPath segments
]

{
	#category : #delegated,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>pathString [
	^ self resolve pathString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>permissions [
	"Return the FileSystemPermission for this node"
	^ self resolve permissions
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>readStream [
	self subclassResponsibility
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>readStreamDo: aBlock [
	| stream |
	stream := self readStream.
	^ [ aBlock value: stream ] 
		ensure: [ stream close ]
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>readStreamDo: doBlock ifAbsent: absentBlock [
	^ self isFile 
		ifTrue: [ self readStreamDo: doBlock ]
		ifFalse: absentBlock
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>readStreamIfAbsent: absentBlock [
	^ self isFile
		ifTrue: [ self readStream ]
		ifFalse: absentBlock
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>relativeTo: landmark [
	"Answer a new path relative to landmark."
	
	"parent/child/grandChild relativeTo: parent returns child/grandChild
	(Filesystem disk / 'griffle' / 'plonk' / 'nurp') relativeTo: (Filesystem disk / 'griffle') 
	returns plonk/nurp"

	^ landmark makeRelative: self resolve
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>relativeToPath: landmarkPath  [
	
	^ self fullPath relativeTo: landmarkPath
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>relativeToReference: landmarkReference [
	"Return the path of the receiver relative to landmarkReference."
	
	^ self fullPath relativeTo: landmarkReference path
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>renameTo: newBasename [
	self subclassResponsibility
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>resolve [
	^ self subclassResponsibility 
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>resolve: anObject [
	^ anObject asResolvedBy: self
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>resolvePath: aPath [
	^ self withPath: (self path resolvePath: aPath)
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>resolveReference: aReference [
	^ aReference isAbsolute
		ifTrue: [ aReference ]
		ifFalse: [ self withPath: aReference path ]
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>resolveString: aString  [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>size [
	"Return the size of the file in bytes."
	
	^ self resolve size
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>streamWritable: writable do: aBlock [
	^ writable 
		ifTrue: [ self writeStreamDo: aBlock ]
		ifFalse: [ self readStreamDo: aBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>uri [
	"Convert my path into a file:// type url. For odd characters use %20 notation."

	^ self asUrl
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>withExtension: aString [
	^ self withPath: (self path withExtension: aString)
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>withPath: newPath [
	^ self path == newPath
		ifTrue: [ self ]
		ifFalse: [ self copyWithPath: newPath ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>withoutExtension [
  "Returns the new reference based on receiver with fullname without its extension"

  ^  (self parent / self basenameWithoutExtension)
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>writeStream [
	self subclassResponsibility
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>writeStreamDo: aBlock [
	| stream |
	stream := self writeStream.
	^ [ aBlock value: stream ]
		ensure: [ stream close ]
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>writeStreamDo: doBlock ifPresent: presentBlock [
	^ self isFile
		ifTrue: presentBlock
		ifFalse: [ self writeStreamDo: doBlock ]
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:22'
}
AbstractFileReference>>writeStreamIfPresent: presentBlock [
	^ self isFile 
		ifTrue: presentBlock
		ifFalse: [ self writeStream ]
]
