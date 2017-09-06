"

"
Class {
	#name : #MCFileTreeFileSystemUtils,
	#superclass : #MCFileTreeFileUtils,
	#category : #MonticelloFileTree-FileSystem-Utilities,
	#timestamp : ''
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>default [
    ^ DiskStore activeClass createDefault defaultWorkingDirectory asFileReference
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>deleteAll: aDirectory [
    ^ aDirectory deleteAll
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>directoryExists: aDirectory [
    ^ aDirectory isDirectory
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>directoryFromEntry: directoryEntry [
    ^ directoryEntry asFileReference
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>directoryFromPath: directoryPath [
    ^ (AbsolutePath from: directoryPath delimiter: self pathNameDelimiter) asFileReference
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>directoryFromPath: directoryPath relativeTo: aDirectory [
    ^ aDirectory resolveString: directoryPath
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>directoryName: aDirectory [
    ^ aDirectory basename
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>directoryPathString: aDirectory [
    ^ aDirectory pathString
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>ensureDirectoryExists: aDirectory [
    aDirectory ensureCreateDirectory
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>ensureFilePathExists: fileNameOrPath relativeTo: aDirectory [
    (aDirectory resolveString: fileNameOrPath) parent ensureCreateDirectory
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>filePathExists: filePath relativeTo: aDirectory [
    ^ (aDirectory resolveString: filePath) isFile
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>initialize [
    "self initialize"

    self install
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>parentDirectoryOf: aDirectory [
    ^ aDirectory parent
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>pathNameDelimiter [
    ^ DiskStore activeClass delimiter
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>readStreamFor: filePath in: aDirectory do: aBlock [
    "temporary hack for Pharo-1.4"

    ^ (aDirectory resolveString: filePath)
        readStreamDo: [ :fileStream | 
            | stream |
            stream := ReadStream on: fileStream contents asString.
            stream reset.
            aBlock value: stream ]
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>resolvePath: path in: aDirectory [
    ^ aDirectory resolveString: path
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:59'
}
MCFileTreeFileSystemUtils class>>writeStreamFor: filePath in: aDirectory do: aBlock [
    (aDirectory resolveString: filePath) writeStreamDo: aBlock
]
