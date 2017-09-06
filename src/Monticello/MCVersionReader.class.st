"
A version reader
"
Class {
	#name : #MCVersionReader,
	#superclass : #MCReader,
	#instVars : [
		'package',
		'info',
		'definitions',
		'dependencies'
	],
	#category : #Monticello-Storing,
	#timestamp : 'TorstenBergmann 2/5/2014 13:53'
}

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader class>>file: fileName streamDo: aBlock [
	
	^ FileStream 
			readOnlyFileNamed: fileName 
			do: [:file | aBlock value: file]
]

{
	#category : #'actions - file',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader class>>loadVersionFile: fileName [
	| version |
	version := self versionFromFile: fileName.
	version workingCopy repositoryGroup addRepository:
		(MCDirectoryRepository new directory: fileName asFileReference).
	version load.

]

{
	#category : #'actions - file',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader class>>mergeVersionFile: fileName [
	(self versionFromFile: fileName) merge
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader class>>on: s fileName: f [
	^ self on: s
]

{
	#category : #'actions - file',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader class>>openVersionFile: fileName [
	(self versionFromFile: fileName) open
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader class>>versionFromFile: fileName [
	^ self file: fileName streamDo: [:stream | self versionFromStream: stream]
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader class>>versionFromStream: aStream [
	^ (self on: aStream) version
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader class>>versionInfoFromStream: aStream [
	^ (self on: aStream) info
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>basicVersion [
	^ MCVersion
		package: self package
		info: self info
		snapshot: [ self snapshot ]
		dependencies: self dependencies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>definitions [
	definitions ifNil: [self loadDefinitions].
	^ definitions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>dependencies [
	dependencies ifNil: [self loadDependencies].
	^ dependencies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>info [
	info ifNil: [self loadVersionInfo].
	^ info
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>loadDefinitions [
	self subclassResponsibility 
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>loadDependencies [
	self subclassResponsibility 
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>loadPackage [
	self subclassResponsibility 
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>loadVersionInfo [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>package [
	package ifNil: [self loadPackage].
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>snapshot [
	^ MCSnapshot fromDefinitions: self definitions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionReader>>version [
	^ self basicVersion
]
