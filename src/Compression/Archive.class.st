"
This is the abstract superclass for file archives. Archives can be read from or written to files, and contain members that represent files and directories.
"
Class {
	#name : #Archive,
	#superclass : #Object,
	#instVars : [
		'members'
	],
	#category : #Compression-Archives,
	#timestamp : '<historical>'
}

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addDirectory: aFileName [
	^self addDirectory: aFileName as: aFileName

]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addDirectory: aFileName as: anotherFileName [
	| newMember |
	newMember := self memberClass newFromDirectory: aFileName.
	self addMember: newMember.
	newMember localFileName: anotherFileName.
	^newMember
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addFile: aFileName [
	^self addFile: aFileName as: aFileName
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addFile: aFileName as: anotherFileName [
	| newMember |
	newMember := self memberClass newFromFile: aFileName.
	newMember localFileName: anotherFileName.
	self addMember: newMember.
	^newMember
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addMember: aMember [
	^members addLast: aMember
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addString: aString as: aFileName [
	| newMember |
	newMember := self memberClass newFromString: aString named: aFileName.
	self addMember: newMember.
	newMember localFileName: aFileName.
	^newMember
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addTree: aFileNameOrDirectory match: aBlock  [
	| nameSize |
	nameSize := aFileNameOrDirectory isString
				ifTrue: [aFileNameOrDirectory size]
				ifFalse: [aFileNameOrDirectory fullName size].
	^ self
		addTree: aFileNameOrDirectory
		removingFirstCharacters: nameSize + 1
		match: aBlock
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addTree: aFileNameOrDirectory removingFirstCharacters: n  [
	^ self
		addTree: aFileNameOrDirectory
		removingFirstCharacters: n
		match: [:e | true]
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>addTree: aFileNameOrDirectory removingFirstCharacters: n match: aBlock [
	| dir relativePath matches |
	dir := aFileNameOrDirectory asFileReference.
	relativePath := (dir fullName allButFirst: n) asFileReference.
	matches := dir entries select: [ :entry | aBlock value: entry ].
	matches
		do: [ :e | | newMember |
			newMember := e isDirectory
					ifTrue: [ self memberClass newFromDirectory: e fullName ]
					ifFalse: [ self memberClass newFromFile: e fullName ].
		newMember localFileName: (relativePath / e name) fullName.
		self addMember: newMember.
		e isDirectory ifTrue: [ self addTree: e fullName removingFirstCharacters: n match: aBlock ].
	].

]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>canWriteToFileNamed: aFileName [
	"Catch attempts to overwrite existing zip file"
	^(members anySatisfy: [ :ea | ea usesFileNamed: aFileName ]) not.

]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>contentsOf: aMemberOrName [
	| member |
	member := self member: aMemberOrName.
	member ifNil: [ ^nil ].
	^member contents
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>extractMember: aMemberOrName [
	| member |
	member := self member: aMemberOrName.
	member ifNil: [ ^nil ].
	member 
		extractToFileNamed: member localFileName 
		inDirectory: FileSystem workingDirectory.
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>extractMember: aMemberOrName toFileNamed: aFileName [
	| member |
	member := self member: aMemberOrName.
	member ifNil: [ ^nil ].
	member extractToFileNamed: aFileName
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>extractMemberWithoutPath: aMemberOrName [
	self 
		extractMemberWithoutPath: aMemberOrName
		inDirectory: FileSystem workingDirectory.
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>extractMemberWithoutPath: aMemberOrName inDirectory: dir [
	| member |
	member := self member: aMemberOrName.
	member ifNil: [ ^nil ].
	member extractToFileNamed: (member asFileReference basename) inDirectory: dir
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>initialize [
	super initialize.
	members := OrderedCollection new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>member: aMemberOrName [
	^(members includes: aMemberOrName)
		ifTrue: [ aMemberOrName ]
		ifFalse: [ self memberNamed: aMemberOrName ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>memberClass [
	self subclassResponsibility
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>memberNamed: aString [
	"Return the first member whose zip name or local file name matches aString, or nil"
	^members detect: [ :ea | ea fileName = aString or: [ ea localFileName = aString ]] ifNone: [ ]
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>memberNames [
	^members collect: [ :ea | ea fileName ]
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>members [
	^members
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>membersMatching: aString [
	^members select: [ :ea | (aString match: ea fileName) or: [ aString match: ea localFileName ] ]
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>numberOfMembers [
	^members size
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>removeMember: aMemberOrName [
	| member |
	member := self member: aMemberOrName.
	member ifNotNil: [ members remove: member ].
	^member
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>replaceMember: aMemberOrName with: newMember [
	| member |
	member := self member: aMemberOrName.
	member ifNotNil: [ members replaceAll: member with: newMember ].
	^member
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>setContentsOf: aMemberOrName to: aString [
	| newMember oldMember |
	oldMember := self member: aMemberOrName.
	newMember := (self memberClass newFromString: aString named: oldMember fileName)
		copyFrom: oldMember.
	self replaceMember: oldMember with: newMember.
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>writeTo: aStream [
	self subclassResponsibility
]

{
	#category : #'archive operations',
	#timestamp : ' 8/31/2017 07:17:01'
}
Archive>>writeToFileNamed: aFileName [

	"Catch attempts to overwrite existing zip file"
	(self canWriteToFileNamed: aFileName)
		ifFalse: [ ^self error: (aFileName, ' is needed by one or more members in this archive') ].
	StandardFileStream 
		forceNewFileNamed: aFileName
		do:  [:stream | self writeTo: stream ]
		
]
