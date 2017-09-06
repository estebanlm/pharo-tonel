"
Snapshot reader
"
Class {
	#name : #MCFileTreeStSnapshotReader,
	#superclass : #MCFileTreeAbstractReader,
	#category : #MonticelloFileTree-Core,
	#timestamp : 'TorstenBergmann 2/20/2014 15:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeStSnapshotReader class>>extension [
    ^ 'pkg'
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:43'
}
MCFileTreeStSnapshotReader>>addClassAndMethodDefinitionsFromDirectory: aDirectory [
    | snapshot classes entries extensions |
    snapshot := self fileUtils directoryFromPath: 'snapshot' relativeTo: aDirectory.
    classes := self fileUtils directoryFromPath: 'classes' relativeTo: snapshot.
    (self fileUtils directoryExists: classes)
        ifTrue: [ 
            self addClassAndMethodDefinitionsFromDirectoryEntries: (entries := classes entries).	"load .st files from subdirectories (*.class) of snapshot/classes ... class defintions"
            entries
                do: [ :classDirectoryEntry | 
                    | classDirectory |
                    classDirectory := self fileUtils directoryFromEntry: classDirectoryEntry.
                    self addClassAndMethodDefinitionsFromDirectoryEntries: classDirectory entries	"load .st files from subdirectories (class or instance) of snapshot/classes/*.class ... method definitions" ] ].
    extensions := self fileUtils directoryFromPath: 'extensions' relativeTo: snapshot.
    (self fileUtils directoryExists: extensions)
        ifTrue: [ 
            extensions entries
                do: [ :classDirectoryEntry | 
                    | classDirectory |
                    classDirectory := self fileUtils directoryFromEntry: classDirectoryEntry.
                    self addClassAndMethodDefinitionsFromDirectoryEntries: classDirectory entries	"load .st files from subdirectories (class or instance) of snapshot/extensions/*.class ... method definitions" ] ]
]
