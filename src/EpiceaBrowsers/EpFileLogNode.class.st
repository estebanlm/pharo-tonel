"
I am a node in a tree of Epicea logs that represents a log file. Read more in my superclass comment.
"
Class {
	#name : #EpFileLogNode,
	#superclass : #EpLogNode,
	#instVars : [
		'globalName',
		'directoryEntry',
		'log'
	],
	#category : #EpiceaBrowsers-UI-Graph,
	#timestamp : 'MartinDias 1/20/2017 13:24'
}

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode class>>fromAllLogsIn: directory [
	
	| nodes |
	nodes := directory entries 
		select: [ :each | each basename endsWith: OmFileStore defaultFileSuffix ]
		thenCollect: [ :entry | self withEntry: entry ].
		
	^ nodes
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode class>>withEntry: aDirectoryEntry [

	^ self basicNew 
		initializeWithEntry: aDirectoryEntry;
		yourself 
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode>>asMorph [

	| morphFactory |
	morphFactory := EpMorphFactory default.
	
	^ morphFactory rowWithAll: {
		morphFactory emphasizedStringFor: self globalName.
		morphFactory smallGap.
		morphFactory secondaryStringFor: self modificationTime asDate epiceaBrowsersAsString.
	}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode>>fileReference [

	^ directoryEntry asFileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode>>globalName [

	^ globalName ifNil: [
		globalName := OmFileStore globalNameFrom: directoryEntry ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode>>initializeWithEntry: aDirectoryEntry [

	directoryEntry := aDirectoryEntry.

	self initialize.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode>>log [

	^ log ifNil: [ 
		log := EpLog newWithStore: self ombuStore ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode>>modificationTime [

	^ directoryEntry modificationTime
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFileLogNode>>ombuStore [

	^ OmStoreFactory current fromFile: self fileReference
]
