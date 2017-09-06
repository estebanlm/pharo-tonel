"
SUnit tests for FileSystemDirectoryEntry
"
Class {
	#name : #DirectoryEntryTest,
	#superclass : #TestCase,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:38'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>entry [
	^ FileLocator image resolve entry
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>testCreationTimeIsADateAndTimeInstance [
	"While creation is the message sent to a directory entry, creation returns a DateAndTime object"

	| creation |
	creation := self entry creation.
	self assert: creation class = DateAndTime.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>testIsDirectory [
	| ref entry |
	ref := FileLocator imageDirectory resolve.
	entry := ref entry.
	self assert: entry isDirectory
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>testIsFile [
	self assert: self entry isFile.
	self deny: self entry isDirectory
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>testIsNotDirectory [
	self deny: self entry isDirectory
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>testIsNotFile [
	| ref |
	ref := FileLocator imageDirectory resolve.
	self deny: ref entry isFile
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>testModificationTimeIsADateAndTimeInstance [
	"While modification is the message sent to a directory entry, modification returns a DateAndTime object"

	| modification |
	modification := self entry modification.
	self assert: modification class = DateAndTime.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>testReference [
	| ref entry |
	ref := FileLocator image resolve.
	entry := ref entry.
	self assert: entry reference = ref
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DirectoryEntryTest>>testSize [
	self assert: self entry size isInteger
]
