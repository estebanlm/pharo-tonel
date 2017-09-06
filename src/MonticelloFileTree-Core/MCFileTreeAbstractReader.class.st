"
Abstract reader superclass for FileTree
"
Class {
	#name : #MCFileTreeAbstractReader,
	#superclass : #MCMczReader,
	#instVars : [
		'packageDirectory',
		'packageProperties'
	],
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 15:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader class>>monticelloMetaDirName [
    ^ '.'
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader class>>on: s fileName: f [
	^ (self on: s)
		packageDirectory: f;
		yourself
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>addClassAndMethodDefinitionsFromDirectory: aDirectory [
    self subclassResponsibility
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>addClassAndMethodDefinitionsFromDirectoryEntries: entries [
    | timestamp |
    self noMethodMetaData
        ifTrue: [ timestamp := self info author , ' ' , self info date mmddyyyy , ' ' , self info time print24 ].
    entries
        do: [ :element | 
            element isDirectory
                ifTrue: [ 
                    | directory |
                    directory := self fileUtils directoryFromEntry: element.
                    ((self separateMethodMetaAndSource or: [ self noMethodMetaData ])
                        ifTrue: [ directory entries select: [ :entry | entry name endsWith: '.st' ] ]
                        ifFalse: [ directory entries ])
                        do: [ :file | 
                            | definition |
                            (definition := self definitionFromFile: file inDirectory: directory)
                                ifNotNil: [ 
                                    definition isMethodDefinition
                                        ifTrue: [ 
                                            self separateMethodMetaAndSource
                                                ifTrue: [ 
                                                    directory
                                                        fileNamed: definition selector asString , '.meta'
                                                        do: [ :fileStream | definition setTimeStamp: (Author fixStamp: fileStream contents) ] ].
                                            self noMethodMetaData
                                                ifTrue: [ definition setTimeStamp: timestamp ] ].
                                    definitions add: definition ] ] ] ]
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>addDefinitionFromFile: directoryEntry inDirectory: aDirectory [
    (self definitionFromFile: directoryEntry inDirectory: aDirectory) ifNotNil: [ :def | definitions add: def ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>basicVersion [
	^ (MCVersion new)
		setPackage: self package
			info: self info
			snapshot: self snapshot
			dependencies: self dependencies;
		yourself
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>definitionFromFile: directoryEntry inDirectory: aDirectory [
    | defs reader |
    directoryEntry ifNil: [ ^ nil ].
    self fileUtils
        readStreamFor: directoryEntry name
        in: aDirectory
        do: [ :fileStream |
            reader := MCStReader on: fileStream.
            defs := reader definitions.
		defs size <= 1
                ifFalse: [ self error: 'we should be writing exactly 1 definition per file' ] ].
    defs size = 0
        ifTrue: [ ^ nil ].
    ^ defs first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>fileUtils [
    ^ MCFileTreeFileUtils current
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>hasMonticelloMetadata [
    ^ (self fileUtils
		filePathExists: 'version'
		relativeTo:
			(self fileUtils
				directoryFromPath: MCFileTreeStCypressWriter monticelloMetaDirName
				relativeTo: packageDirectory))
		or:
			[ (self fileUtils
				filePathExists: 'version'
				relativeTo: packageDirectory)
				and:
					[ self fileUtils
						filePathExists: 'package'
						relativeTo: packageDirectory ] ]

]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>loadDefinitions [
    | entries |
    definitions := OrderedCollection new.
    entries := packageDirectory entries.
    self
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'categories' ] ifNone: [  ])
            inDirectory: packageDirectory;
        addClassAndMethodDefinitionsFromDirectory: packageDirectory;
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'initializers' ] ifNone: [  ])
            inDirectory: packageDirectory
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>loadDependencies [
    | dependencyDir directoryPath |
    directoryPath := self monticelloMetaDirName , self fileUtils pathNameDelimiter asString , 'dependencies'.
    dependencyDir := self fileUtils directoryFromPath: directoryPath relativeTo: packageDirectory.
    (self fileUtils directoryExists: dependencyDir)
        ifFalse: [ ^ dependencies := #() ].
    dependencies := OrderedCollection new.
    dependencyDir entries
        do: [ :entry | 
            dependencies
                add:
                    (MCVersionDependency
                        package: (MCPackage named: entry name)
                        info:
                            (self extractInfoFrom: (self parseMember: 'dependencies' , self fileUtils pathNameDelimiter asString , entry name))) ].
    dependencies := dependencies asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>monticelloMetaDirName [
    ^ self class monticelloMetaDirName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>noMethodMetaData [
    ^ self packageProperties at: 'noMethodMetaData' ifAbsent: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>packageDirectory: aDirectoryName [
    packageDirectory := self fileUtils directoryFromPath: aDirectoryName relativeTo: stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>packageProperties [
    packageProperties
        ifNil: [ 
            packageProperties := Dictionary new.
            (packageDirectory entries detect: [ :entry | entry name = '.filetree' ] ifNone: [  ])
                ifNotNil: [ :configEntry | 
                    configEntry
                        readStreamDo: [ :fileStream | 
                            | jsonObject structureVersion |
                            [ 
                            (jsonObject := STON fromStream: fileStream) isFloat
                                ifTrue: [ 
                                    "
							0.0 - original structure
							0.1 - separate files for method metaData (timestamp) and source
							0.2 - no method metaData file"
                                    packageProperties := Dictionary new.
                                    structureVersion := jsonObject printShowingDecimalPlaces: 1.
                                    packageProperties at: 'noMethodMetaData' put: structureVersion = '0.2'.
                                    packageProperties at: 'separateMethodMetaAndSource' put: structureVersion = '0.1' ]
                                ifFalse: [ 
                                    packageProperties := jsonObject.
                                    ((packageProperties at: 'noMethodMetaData' ifAbsent: [ false ])
                                        and: [ packageProperties at: 'separateMethodMetaAndSource' ifAbsent: [ false ] ])
                                        ifTrue: [ self error: 'noMethodMetaData and separateMethodMetaAndSource cannot both be true' ] ] ]
                                on: Error
                                do: [ :ex | 
                                    Transcript
                                        cr;
                                        show:
                                                'Error reading package properties (.filetree): ' , packageDirectory pathName , ' :: ' , ex description ] ] ] ].
    ^ packageProperties
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>parseMember: fileName [
    | directory tokens |
    directory := self fileUtils directoryFromPath: self monticelloMetaDirName relativeTo: packageDirectory.
    self fileUtils readStreamFor: fileName in: directory do: [ :fileStream | tokens := self scanner scan: fileStream ].
    ^ self associate: tokens
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeAbstractReader>>separateMethodMetaAndSource [
    ^ self packageProperties at: 'separateMethodMetaAndSource' ifAbsent: [ false ]
]
