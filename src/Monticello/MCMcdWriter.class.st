"
Writing MCD format
"
Class {
	#name : #MCMcdWriter,
	#superclass : #MCMczWriter,
	#category : #Monticello-Storing,
	#timestamp : 'TorstenBergmann 2/6/2014 08:08'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMcdWriter class>>readerClass [
	^ MCMcdReader
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMcdWriter>>writeBaseInfo: aVersionInfo [
	| string |
	string := self serializeVersionInfo: aVersionInfo.
	self addString: string at: 'base' encodedTo: 'utf8'.

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMcdWriter>>writeDefinitions: aVersion [
	self writeBaseInfo: aVersion baseInfo.
	self writePatch: aVersion patch.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMcdWriter>>writeNewDefinitions: aCollection [
	self addString: (self serializeDefinitions: aCollection) at: 'new/source.', self snapshotWriterClass extension encodedTo: 'utf8'.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMcdWriter>>writeOldDefinitions: aCollection [
	self addString: (self serializeDefinitions: aCollection) at: 'old/source.', self snapshotWriterClass extension encodedTo: 'utf8'.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMcdWriter>>writePatch: aPatch [
	| old new |
	old := OrderedCollection new.
	new := OrderedCollection new.
	aPatch operations do:
		[:ea |
		ea isRemoval ifTrue: [old add: ea definition].
		ea isAddition ifTrue: [new add: ea definition].
		ea isModification ifTrue: [old add: ea baseDefinition. new add: ea definition]].
	self writeOldDefinitions: old.
	self writeNewDefinitions: new.
	self addString: (self serializeInBinary: aPatch) at: 'patch.bin'.
]
