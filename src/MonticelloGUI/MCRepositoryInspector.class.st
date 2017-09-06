"
Inspector for a repository
"
Class {
	#name : #MCRepositoryInspector,
	#superclass : #MCVersionInspector,
	#instVars : [
		'repository',
		'packages',
		'versions',
		'selectedPackage',
		'selectedVersion'
	],
	#category : #MonticelloGUI,
	#timestamp : 'TorstenBergmann 2/20/2014 15:53'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector class>>repository: aFileBasedRepository workingCopy: aWorkingCopy [
	^self new
		setRepository: aFileBasedRepository workingCopy: aWorkingCopy;
		yourself
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>buttonSpecs [
	^#(('Refresh' refresh 'refresh the version-list')) , super buttonSpecs
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>defaultLabel [
	^'Repository: ' , repository description
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>hasVersion [
	^ selectedVersion notNil
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>initialExtent [
	^450@300
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>load [
	self hasVersion
		ifFalse: [ ^ self ].
	super load.
	self version workingCopy repositoryGroup addRepository: repository
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>packageList [
	^ packages collect: [:ea | ea name]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>packageListMenu: aMenu [
	^aMenu
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>packageSelection [
	^ packages indexOf: selectedPackage
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>packageSelection: aNumber [
	selectedPackage := aNumber isZero ifFalse: [ packages at: aNumber ].
	versions := repository versionsAvailableForPackage: selectedPackage.
	self changed: #packageSelection; changed: #versionList
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>refresh [
	packages := repository packages.
	self changed: #packageList.
	self packageSelection: self packageSelection.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>setRepository: aRepository workingCopy: aWorkingCopy [
	repository := aRepository.
	aWorkingCopy ifNotNil: [ selectedPackage := aWorkingCopy package].
	self refresh
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>sortedVersions [
	| sorter |
	sorter := MCVersionSorter new.
	sorter addAllVersionInfos: versions.
	^ sorter sortedVersionInfos select: [:ea | versions includes: ea]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>summary [
	^ selectedVersion
		ifNotNil: [selectedVersion summary]
		ifNil: ['']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>version [
	^ version ifNil: [version := repository versionWithInfo: selectedVersion]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>versionList [
	^ self sortedVersions collect: [:ea | ea name]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>versionListMenu: aMenu [
	^aMenu
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>versionSelection [
	^ versions indexOf: selectedVersion
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>versionSelection: aNumber [
	selectedVersion := aNumber isZero
		ifTrue: [ nil ]
		ifFalse: [ versions at: aNumber ].
	self
		changed: #versionSelection;
		changed: #summary
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCRepositoryInspector>>widgetSpecs [
	^#(	((buttonRow) (0 0 1 0) (0 0 0 30))
		((listMorph: package) (0 0 0.5 0.6) (0 30 0 0))
		((listMorph: version) (0.5 0 1 0.6) (0 30 0 0))
		((textMorph: summary) (0 0.6 1 1) (0 0 0 0)) )
]
