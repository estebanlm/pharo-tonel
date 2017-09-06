"
A metacello repository in a directory 
"
Class {
	#name : #MCDirectoryRepository,
	#superclass : #MCFileBasedRepository,
	#instVars : [
		'directory'
	],
	#classVars : [
		'DefaultDirectoryName'
	],
	#category : #Monticello-Repositories,
	#timestamp : 'TorstenBergmann 2/5/2014 13:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository class>>defaultDirectoryName [
	^ DefaultDirectoryName ifNil: [
		DefaultDirectoryName :=  FileSystem workingDirectory fullName].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository class>>defaultDirectoryName: aDirectoryName [
	DefaultDirectoryName := aDirectoryName.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository class>>description [
	^ 'directory'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository class>>morphicConfigure [
	^ (UIManager default chooseDirectoryFrom: self defaultDirectoryName asFileReference) ifNotNil:
		[:directory |
		self new directory: directory]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>allFileNamesForVersionNamed: aString [
	"avoid slow default implementation and directly check for existing files"
	|extensions|
	extensions := MCReader concreteSubclasses collect: [ :class| class extension ].
	^ extensions 
		collect: [ :extension| aString , '.', extension ]
		thenSelect: [ :fileName| self includesFileNamed: fileName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>description [
	^ directory fullName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>directory [
	^ directory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>directory: aDirectory [
	directory := aDirectory
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>hash [
	^ directory hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>includesFileNamed: aString [
	"HACK: speed up the cache hits"
	^ (directory / aString) exists.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>includesVersionNamed: aString [
	"avoid slow default implementation and directly check for existing files"
	^ (self allFileNamesForVersionNamed: aString) isEmpty not
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>initialize [
	super initialize.
	directory := FileSystem workingDirectory
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>isValid [
	^directory exists
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>loadAllFileNames [
	^ (directory entries sort: [:a :b | a modificationTime >= b modificationTime]) collect: [:ea | ea basename]
]

{
	#category : #i/o,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>readStreamForFileNamed: aString do: aBlock [
	| val |
	directory / aString readStreamDo: [ :stream|
		val := aBlock value: stream ].
	^ val
]

{
	#category : #i/o,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDirectoryRepository>>writeStreamForFileNamed: aString replace: shouldReplace do: aBlock [

	| file |
	file := directory / aString.

	shouldReplace ifTrue: [ file ensureDelete ].

	file writeStreamDo:  [ :stream | 
		aBlock value: stream ].
]
