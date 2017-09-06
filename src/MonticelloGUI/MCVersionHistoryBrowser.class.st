"
Browser for version history
"
Class {
	#name : #MCVersionHistoryBrowser,
	#superclass : #MCTool,
	#instVars : [
		'ancestry',
		'index',
		'package',
		'infos'
	],
	#category : #MonticelloGUI,
	#timestamp : 'TorstenBergmann 2/20/2014 15:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>ancestry: anAncestry [
	ancestry := anAncestry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>baseSnapshot [
	^ self snapshotForInfo: ancestry
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>defaultLabel [
	^ ancestry name, ' History'
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>getMenu: aMenu [
	index < 2 ifTrue: [^ aMenu].
	self fillMenu: aMenu fromSpecs: 
		(Array
			with: (Array with: 'view changes -> ', ancestry name with: #viewChanges)
			with: #('spawn history' spawnHistory)).
	^ aMenu
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>index [
	"Answer the value of index"

	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>index: anObject [
	"Set the value of index"

	index := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>infos [
	^ infos ifNil: [infos := ancestry withBreadthFirstAncestors]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>initialExtent [
	^ 440@169.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>list [
	^ self infos collect: [:ea | ea name]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>package: aMCPackage [
	package := aMCPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>repositoryGroup [
	^ MCRepositoryGroup default
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>selectedInfo [
	^ self infos at: self selection ifAbsent: [nil]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>selectedSnapshot [
	^ self snapshotForInfo: self selectedInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>selection [
	^ index ifNil: [0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>selection: aNumber [
	index := aNumber.
	self changed: #selection; changed: #summary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>snapshotForInfo: aVersionInfo [
	^ (self repositoryGroup versionWithInfo: aVersionInfo) snapshot
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>spawnHistory [
	MCVersionHistoryBrowser new
		ancestry: self selectedInfo;
		package: package;
		show
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>summary [
	| selInfo |
	selInfo := self selectedInfo.
	^ selInfo 
		ifNil: ['']
		ifNotNil: [selInfo summary]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionHistoryBrowser>>widgetSpecs [
	^ #(
		((listMorph:selection:menu: list selection getMenu:) (0 0 0.3 1))
		((textMorph: summary) (0.3 0 1 1))
	 	)
]
