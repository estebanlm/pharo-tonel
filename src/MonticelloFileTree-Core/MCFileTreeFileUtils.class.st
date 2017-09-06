"
Utility class for file access
"
Class {
	#name : #MCFileTreeFileUtils,
	#superclass : #Object,
	#classVars : [
		'Current'
	],
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 15:59'
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>buildPathFrom: pathCollection [
    ^ String
        streamContents: [ :stream | pathCollection do: [ :element | stream nextPutAll: element ] separatedBy: [ stream nextPut: self pathNameDelimiter ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>current [
    ^ Current
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>default [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>deleteAll: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>directoryExists: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>directoryFromPath: directoryPath [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>directoryFromPath: directoryPath relativeTo: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>directoryName: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>directoryPathString: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>ensureDirectoryExists: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>ensureFilePathExists: fileNameOrPath relativeTo: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>filePathExists: filePath relativeTo: aDirectory [
    self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>install [
    Current := self
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>parentDirectoryOf: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>pathNameDelimiter [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>readStreamFor: filePath in: aDirectory do: aBlock [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>resolvePath: path in: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeFileUtils class>>writeStreamFor: filePath in: aDirectory do: aBlock [
    self subclassResponsibility
]
