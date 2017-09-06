Extension {
	#name : #MCVersionReader
}

{
	#category : #'*MonticelloFileServices',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionReader class>>fileReaderServicesForFile: fullName suffix: suffix [
	<fileService>
	self subclassesDo:[:class |
	^ ((suffix = class extension) or: [ suffix = '*' ])
		ifTrue: [class services]
		ifFalse: [Array new: 0]]
		
]

{
	#category : #'*MonticelloFileServices',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionReader class>>loadVersionStream: stream fromDirectory: directory [
	| version repository |
	repository := MCDirectoryRepository new directory: directory.
	version := self versionFromStream: stream.
	version workingCopy repositoryGroup addRepository: repository.
	version load.

]

{
	#category : #'*MonticelloFileServices',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionReader class>>mergeVersionStream: stream [
	(self versionFromStream: stream) merge
]

{
	#category : #'*MonticelloFileServices',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionReader class>>openVersionFromStream: stream [
	(self versionFromStream: stream) open
]

{
	#category : #'*MonticelloFileServices',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionReader class>>serviceLoadVersion [
	^ (SimpleServiceEntry
		provider: self
		label: 'Load version'
		selector: #loadVersionStream:fromDirectory:
		description: 'Load a package version'
		buttonLabel: 'Load')
		argumentGetter: [ :fileList | { fileList readOnlyStream . fileList directory } ]
]

{
	#category : #'*MonticelloFileServices',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionReader class>>serviceMergeVersion [
	^ (SimpleServiceEntry
		provider: self
		label: 'Merge version'
		selector: #mergeVersionStream:
		description: 'Merge a package version into the image'
		buttonLabel: 'Merge')
		argumentGetter: [ :fileList | fileList readOnlyStream ]
]

{
	#category : #'*MonticelloFileServices',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionReader class>>serviceOpenVersion [
	^ (SimpleServiceEntry
		provider: self
		label: 'Open version'
		selector: #openVersionFromStream:
		description: 'Open a package version'
		buttonLabel: 'Open')
		argumentGetter: [ :fileList | fileList readOnlyStream ]
]

{
	#category : #'*MonticelloFileServices',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionReader class>>services [
	^ Array 
		with: self serviceLoadVersion
		with: self serviceMergeVersion
		with: self serviceOpenVersion
]
