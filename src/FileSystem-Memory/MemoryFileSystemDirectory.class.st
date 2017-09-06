"
I represent a memory file system entry for a directory
"
Class {
	#name : #MemoryFileSystemDirectory,
	#superclass : #MemoryFileSystemEntry,
	#instVars : [
		'entries'
	],
	#category : #FileSystem-Memory,
	#timestamp : '<historical>'
}

{
	#category : #creation,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>ensureCreateDirectory: aDirectoryName [
	^ self 
		fileEntryAt: aDirectoryName
		put: (self class named: aDirectoryName)
]

{
	#category : #creation,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>ensureCreateFile: aFileName [
	^ self 
		fileEntryAt: aFileName 
		put: (MemoryFileSystemFile named: aFileName)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>entries [
	^ entries
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileEntriesDo: aBlock [
	
	entries keys sort do: [ :fileName|
		aBlock value: (entries at: fileName)].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileEntriesIncludes: aFileName [
	^ entries includesKey: aFileName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileEntryAt: aFileName [
	^ entries at: aFileName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileEntryAt: aFileName ifAbsent: aBlock [
	^ entries at: aFileName ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileEntryAt: aFileName ifPresent: aBlock [
	^ entries at: aFileName ifPresent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileEntryAt: aFileName put: anEntry [
	^ entries 
		at: aFileName 
		ifAbsentPut: [
			self modified.
			anEntry ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileEntryRemove: aFileName [
	^ self fileEntryRemove: aFileName ifAbsent: [ FileDoesNotExist signalWith: aFileName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileEntryRemove: aFileName ifAbsent: absentBlock [
	| deletedEntry |
	deletedEntry := entries removeKey: aFileName ifAbsent: [ ^ absentBlock value ].
	modificationTime := DateAndTime now.
	^ deletedEntry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>fileSize [
	^ 0
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>initialize [
	super initialize.
	entries := Dictionary new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MemoryFileSystemDirectory>>isDirectory [
	^ true
]
