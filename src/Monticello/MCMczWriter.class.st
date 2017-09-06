"
Writing MCZ format
"
Class {
	#name : #MCMczWriter,
	#superclass : #MCWriter,
	#instVars : [
		'zip',
		'infoWriter'
	],
	#category : #Monticello-Storing,
	#timestamp : 'TorstenBergmann 2/6/2014 08:08'
}

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter class>>fileOut: aVersion on: aStream [
	| inst |
	inst := self on: aStream.
	inst writeVersion: aVersion.
	inst flush.
	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter class>>readerClass [
	^ MCMczReader
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>addString: string at: path [
	| member |
	member := zip addString: string as: path.
	member desiredCompressionMethod: ZipArchive compressionDeflated 
	
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>addString: string at: path encodedTo: encodingName [
	| member |
	member := zip addString: (string convertToEncoding: encodingName) as: path.
	member desiredCompressionMethod: ZipArchive compressionDeflated 
	
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>flush [
	zip writeTo: stream.
	stream close
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>format [
	^ '1'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>initialize [
	super initialize.
	zip := ZipArchive new.

]

{
	#category : #serializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>serializeDefinitions: aCollection [
	^String streamContents: [:aStream |
		| writer |
		writer := self snapshotWriterClass on: aStream.
		writer writeDefinitions: aCollection]
]

{
	#category : #serializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>serializeInBinary: aSnapshot [
	| writer s |
	s := RWBinaryOrTextStream on: String new.
	writer := MCDataStream on: s.
	writer nextPut: aSnapshot.
	^ s contents
]

{
	#category : #serializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>serializePackage: aPackage [
	^ '(name ''', aPackage name, ''')'
]

{
	#category : #serializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>serializeVersionInfo: aVersionInfo [
	infoWriter ifNil: [infoWriter := MCVersionInfoWriter new].
	^ String streamContents: [:s |
		infoWriter stream: s.
		infoWriter writeVersionInfo: aVersionInfo]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>snapshotWriterClass [
	^ MCStWriter
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>writeDefinitions: aVersion [
	self writeSnapshot: aVersion snapshot
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>writeFormat [
"	self addString: self format at: 'format'."
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>writePackage: aPackage [
	self addString: (self serializePackage: aPackage) at: 'package' encodedTo: 'utf8'
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>writeSnapshot: aSnapshot [
	self addString: (self serializeDefinitions: aSnapshot definitions) at: 'snapshot/source.', self snapshotWriterClass extension encodedTo: 'utf8'.
	self addString: (self serializeInBinary: aSnapshot) at: 'snapshot.bin'
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>writeVersion: aVersion [
	self writeFormat.
	self writePackage: aVersion package.
	self writeVersionInfo: aVersion info.
	self writeDefinitions: aVersion.
	aVersion dependencies do: [:ea | self writeVersionDependency: ea]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>writeVersionDependency: aVersionDependency [
	| string |
	string := (self serializeVersionInfo: aVersionDependency versionInfo).
	self addString: string at: 'dependencies/', aVersionDependency package name encodedTo: 'utf8'
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>writeVersionInfo: aVersionInfo [
	| string |
	string := self serializeVersionInfo: aVersionInfo.
	self addString: string at: 'version' encodedTo: 'utf8'.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczWriter>>zip [
	^ zip
]
