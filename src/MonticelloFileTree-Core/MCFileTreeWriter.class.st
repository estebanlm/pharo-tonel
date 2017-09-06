"
Writer for the file tree
"
Class {
	#name : #MCFileTreeWriter,
	#superclass : #MCMczWriter,
	#instVars : [
		'directory',
		'packageFileDirectory',
		'cachedPackageFileDirectoryEntries'
	],
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 16:23'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter class>>readerClass [
    "don't expect this message to be sent"

    self shouldNotImplement
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>addString: string at: fileNameOrPath [
    "fileNameOrPath may have one or two elements"

    | utils fullPath path |
    utils := MCFileTreeFileUtils current.
    path := MCFileTreePackageStructureStWriter useCypressWriter
        ifTrue: [ 
            fullPath := utils
                buildPathFrom:
                    {(MCFileTreeStCypressWriter monticelloMetaDirName).
                    fileNameOrPath}.
            utils ensureFilePathExists: fullPath relativeTo: self packageFileDirectory.
            fullPath ]
        ifFalse: [ fileNameOrPath ].
    string isEmpty
        ifFalse: [ utils writeStreamFor: path in: self packageFileDirectory do: [ :file | file nextPutAll: string ] ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>addString: string at: fileNameOrPath encodedTo: ignored [
    "fileNameOrPath may have one or two elements"
    "encodeTo: arg, because FileTree uses UTF8 by default"

    | utils fullPath path |
    utils := MCFileTreeFileUtils current.
    path := MCFileTreePackageStructureStWriter useCypressWriter
        ifTrue: [ 
            fullPath := utils
                buildPathFrom:
                    {(MCFileTreeStCypressWriter monticelloMetaDirName).
                    fileNameOrPath}.
            utils ensureFilePathExists: fullPath relativeTo: self packageFileDirectory.
            fullPath ]
        ifFalse: [ fileNameOrPath ].
    string isEmpty
        ifFalse: [ utils writeStreamFor: path in: self packageFileDirectory do: [ :file | file nextPutAll: string ] ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>deleteExistingPackageStructureFor: members [
    "destroy .tree and .pkg directory structure .. otherwise it won't be pretty"

    | alternateDirName alternateDir packageDirectoryName |
    (self fileUtils directoryExists: self packageFileDirectory)
        ifTrue: [ self fileUtils deleteAll: self packageFileDirectory ].
    packageDirectoryName := self fileUtils directoryName: self packageFileDirectory.
    alternateDirName := (packageDirectoryName endsWith: '.pkg')
        ifTrue: [ members first , '.tree' ]
        ifFalse: [ 
            (packageDirectoryName endsWith: '.tree')
                ifTrue: [ members first , '.pkg' ]
                ifFalse: [ 
                    (packageDirectoryName endsWith: '.package')
                        ifTrue: [ members first , '.pkg' ] ] ].
    alternateDirName
        ifNotNil: [ 
            alternateDir := self fileUtils directoryFromPath: alternateDirName relativeTo: stream directory.
            (self fileUtils directoryExists: alternateDir)
                ifTrue: [ self fileUtils deleteAll: alternateDir ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>fileUtils [
    ^ MCFileTreeFileUtils current
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>flush [
	
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>initializePackageFileDirectoryCache [
    cachedPackageFileDirectoryEntries := Dictionary new.
    self packageFileDirectory entries
        do: [ :entry | 
            entry isDirectory
                ifTrue: [ cachedPackageFileDirectoryEntries at: entry name put: (self fileUtils directoryFromEntry: entry) ] ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>packageFileDirectory [
    packageFileDirectory
        ifNil: [ packageFileDirectory := self fileUtils directoryFromPath: directory relativeTo: stream directory ].
    ^ packageFileDirectory
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>repository [
  ^ stream
]

{
	#category : #serializing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>serializeVersionInfo: aVersionInfo [
	infoWriter ifNil: [infoWriter := MCFileTreeVersionInfoWriter new].
	^ String streamContents: [:s |
		infoWriter stream: s.
		infoWriter writeVersionInfo: aVersionInfo]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>snapshotWriterClass [
	^ MCFileTreeAbstractStWriter
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>subPackageFileDirectoryFor: directoryNameOrPath [
    ^ cachedPackageFileDirectoryEntries
        at: directoryNameOrPath
        ifAbsentPut: [ 
            | dir |
            dir := self fileUtils directoryFromPath: directoryNameOrPath relativeTo: self packageFileDirectory.
            self fileUtils ensureDirectoryExists: dir.
            dir ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>writeSnapshot: aSnapshot [
	(self snapshotWriterClass on: self) writeDefinitions: aSnapshot definitions
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeWriter>>writeVersion: aVersion [
    | members |
    directory := (members := MCFileTreeRepository parseName: aVersion info name) last.
    self deleteExistingPackageStructureFor: members.
    self fileUtils ensureDirectoryExists: self packageFileDirectory.
    self initializePackageFileDirectoryCache.
    super writeVersion: aVersion
]
