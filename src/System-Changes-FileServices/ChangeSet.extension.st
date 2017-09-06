Extension {
	#name : #ChangeSet
}

{
	#category : #'*System-Changes-FileServices',
	#timestamp : ' 8/31/2017 05:26:17'
}
ChangeSet class>>fileIntoNewChangeSet: fullName [
	"File in all of the contents of the currently selected file, if any, into a new change set." 

	| fn ff |
	fullName ifNil: [^ self ].
	
	fn := (Smalltalk hasClassNamed: #GZipReadStream) 
		ifTrue: [(Smalltalk classNamed:  #GZipReadStream) uncompressedFileName: fullName]
		ifFalse: [fullName].
	[ ff := FileStream readOnlyFileNamed: fn.
	self newChangesFromStream: ff named: (fn  asFileReference basename)]
		ensure: [ff ifNotNil: [ff close]]
]

{
	#category : #'*System-Changes-FileServices',
	#timestamp : ' 8/31/2017 05:26:17'
}
ChangeSet class>>fileReaderServicesForFile: fullName suffix: suffix [
	<fileService>
	
	^ (FileStream isSourceFileSuffix: suffix)
		ifTrue: [ self services]
		ifFalse: [#()]
]

{
	#category : #'*System-Changes-FileServices',
	#timestamp : ' 8/31/2017 05:26:17'
}
ChangeSet class>>serviceFileIntoNewChangeSet [
	"Answer a service for installing a file into a new change set"

	^ SimpleServiceEntry 
		provider: self 
		label: 'Install into new change set'
		selector: #fileIntoNewChangeSet:
		description: 'Install the file as a body of code in the image: create a new change set and file-in the selected file into it'
		buttonLabel: 'Install'
]

{
	#category : #'*System-Changes-FileServices',
	#timestamp : ' 8/31/2017 05:26:17'
}
ChangeSet class>>services [
	^ Array with: self serviceFileIntoNewChangeSet
]
