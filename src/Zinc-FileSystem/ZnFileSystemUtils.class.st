"
I am ZnFileSystemUtils.
I help is abstracting over API differences pre and post the introduction of FileSystem in Pharo 2.0

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnFileSystemUtils,
	#superclass : #Object,
	#category : #Zinc-FileSystem,
	#timestamp : '<historical>'
}

{
	#category : #paths,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>baseNameFor: fileName [
	^ fileName asFileReference basename 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>defaultDirectory [
	^ FileSystem disk workingDirectory
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>defaultDirectoryPath [
	^ self defaultDirectory fullName
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>delete: path [
	^ path asFileReference delete
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>deleteIfExists: path [
	^ (self exists: path)
		ifTrue: [ self delete: path. true ]
		ifFalse: [ false ]
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>directory: path [
	^ path asFileReference
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>downloadPathTo: directoryOrFileName for: baseName [
	| downloadPath |
	downloadPath := directoryOrFileName asFileReference.
	^ downloadPath isDirectory
		ifTrue: [
			baseName ifNil: [ 
				self error: 'Not enough information to construct a download path' ]. 
			(downloadPath / baseName) fullName ]
		ifFalse: [ 
			directoryOrFileName ]
	
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>exists: path [
	^ path asFileReference exists
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>extensionFor: fileName [
	^ fileName asFileReference extension
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>fileNamed: fileName do: block [
	^ fileName asFileReference 
		writeStreamDo: block
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>fileSizeFor: fileName [
	^ fileName asFileReference entry size
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>fileStreamFor: fileName [
	^ fileName asFileReference 
		writeStream
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>fullNameFor: fileName [
	^ fileName asFileReference fullName
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>modificationTimeFor: path [
	^ path asFileReference entry modificationTime 
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>newFileNamed: fileName do: block [
	^ fileName asFileReference 
		writeStreamDo: block 
		ifPresent: [ FileExists signalWith: fileName asFileReference ]
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>oldFileNamed: fileName do: block [
	^ fileName asFileReference 
		readStreamDo: block
		ifAbsent: [ FileDoesNotExist signalWith: fileName asFileReference ]
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 07:16:45'
}
ZnFileSystemUtils class>>oldFileStreamFor: fileName [
	^ fileName asFileReference 
		readStreamIfAbsent: [ FileDoesNotExist signalWith: fileName asFileReference ]
]
