"
Abstract superclass for FileTree writers
"
Class {
	#name : #MCFileTreeAbstractStWriter,
	#superclass : #MCWriter,
	#instVars : [
		'stWriter',
		'initializers',
		'orderedClassNames',
		'orderedTraitNames'
	],
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 15:56'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter class>>monticelloMetaDirName [
    ^ '.'
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter class>>on: aStream [
    MCFileTreePackageStructureStWriter useCypressWriter
        ifTrue: [ ^ MCFileTreeStCypressWriter new stream: aStream ].
    ^ (MCFileTreePackageStructureStWriter useSnapShotWriter
        ifTrue: [ MCFileTreeStSnapshotWriter ]
        ifFalse: [ MCFileTreeStWriter ]) new stream: aStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter class>>readerClass [
	^ MCStReader
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>directoryForDirectoryNamed: directoryNameOrPath [
    ^ directoryNameOrPath = '.'
        ifTrue: [ stream packageFileDirectory ]
        ifFalse: [ stream subPackageFileDirectoryFor: directoryNameOrPath ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>fileNameForSelector: selector [
    ^ (selector == #'/'
        ifTrue: [ 'encoded slash' ]
        ifFalse: [ 
            (selector includes: $/)
                ifTrue: [ 'encoded' , selector copyReplaceAll: '/' with: ' slash ' ]
                ifFalse: [ selector ] ]) asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>fileUtils [
    ^ MCFileTreeFileUtils current
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>initialize [
    stWriter := MCFileTreePackageStructureStWriter new
        initializers: (initializers := Set new);
        yourself.
    orderedClassNames := OrderedCollection new.
    orderedTraitNames := OrderedCollection new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>monticelloMetaDirName [
    ^ self class monticelloMetaDirName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>repository [
  ^ stream repository
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>setFileStream: file [
    stWriter stream: file
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>visitClassDefinition: definition [
    self subclassResponsibility
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>visitClassTraitDefinition: definition [
    self subclassResponsibility
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>visitMetaclassDefinition: definition [
    "handled by class definition"


]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>visitMethodDefinition: definition [
    self subclassResponsibility
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>visitOrganizationDefinition: defintion [
    self
        writeInDirectoryName: self monticelloMetaDirName
        fileName: 'categories'
        extension: '.st'
        visit: [ defintion categories do: [ :cat | stWriter writeCategory: cat ] ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>visitScriptDefinition: definition [
    self flag: #'skippedForNow'
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>visitTraitDefinition: definition [
    self subclassResponsibility
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writeBasicDefinitions: aCollection [
    "the correct initialization order is unknown if some classes are missing in the image"

    self writePropertiesFile.
    stWriter acceptVisitor: self forDefinitions: aCollection.
    self writeInitializers
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writeClassDefinition: definition [
    stWriter writeClassDefinition: definition.
    (definition hasClassInstanceVariables or: [definition hasClassTraitComposition])
        ifTrue: [ stWriter writeMetaclassDefinition: definition ].
    definition hasComment
        ifTrue: [ stWriter writeClassComment: definition ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writeClassTraitDefinition: definition [
    stWriter visitClassTraitDefinition: definition.

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writeDefinitions: aCollection [
    "the correct initialization order is unknown if some classes are missing in the image"

    self writeBasicDefinitions: aCollection
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writeInDirectoryName: directoryNameOrPath fileName: fileName extension: ext visit: visitBlock [
    | directory |
    directory := self directoryForDirectoryNamed: directoryNameOrPath.
    self fileUtils
        writeStreamFor: fileName , ext
        in: directory
        do: [ :fileStream | 
            fileStream lineEndConvention: #'lf'.
            self setFileStream: fileStream.
            visitBlock value ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writeInitializers [
    self
        writeInDirectoryName: self monticelloMetaDirName
        fileName: 'initializers'
        extension: '.st'
        visit: [ 
            stWriter
                writePresentInitializers;
                writeAbsentInitializers ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writeMethodDefinition: definition [
    stWriter visitMethodDefinition: definition
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writePropertiesFile [
    self
        writeInDirectoryName: '.'
        fileName: ''
        extension: '.filetree'
        visit: [ stWriter writeProperties ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractStWriter>>writeTraitDefinition: definition [
    stWriter writeClassDefinition: definition.
    definition hasComment 
        ifTrue: [stWriter writeClassComment: definition].
]
