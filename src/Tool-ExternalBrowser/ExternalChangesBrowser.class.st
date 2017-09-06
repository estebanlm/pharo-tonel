"
I'm a simple changes browser. When the user drop a .cs or .st files and select to view them, I display a sequenceable and simple list of changes and a way to file in the code. 

!! Examples

[[[
ExternalChangesBrowser new openWithSpec.

ExternalChangesBrowser openOn: Smalltalk changesFile fullName
]]]
"
Class {
	#name : #ExternalChangesBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'changes',
		'codePane',
		'changeSet',
		'selectAllButton',
		'deselectAllButton',
		'fileInSelectedButton'
	],
	#category : #Tool-ExternalBrowser,
	#timestamp : 'StephaneDucasse 6/6/2015 10:28'
}

{
	#category : #browsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>browseRecentLog [
	<example>
	^ self openOnStream: SourceFiles changesFileStream
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :col | 
			col
				add: #changes;
				newRow: [ :row | 
					row
						add: #selectAllButton;
						add: #deselectAllButton;
						add: #fileInSelectedButton ] height: 32;
				add: #codePane ]; 
		yourself
]

{
	#category : #'file service',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>fileReaderServicesForFile: fullName suffix: suffix [
	<fileService>
	| services |
	services := OrderedCollection new.
	(FileStream isSourceFileSuffix: suffix) | 
	(FileStream isChangesFileSuffix: suffix) | (suffix = '*')
		ifTrue: [ services add: self serviceBrowseCSOrSTFile ].
	^services
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>openOn: changeSetName [

	self new
		changeSetName: changeSetName;
		openWithSpec
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>openOnFileName: aFileName [

	self new
		changeSetName: aFileName;
		openWithSpec
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>openOnStream: aStream [

	| widget |
	widget := self new.
	widget changes items: (CodeImporter chunksFromStream: aStream).
	widget openWithSpec	
]

{
	#category : #'tool registry',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>registerToolsOn: registry [

	registry register: self as: #changeList 
]

{
	#category : #'file service',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>serviceBrowseCSOrSTFile [
	"Answer a service for opening a changelist browser on a file"

	^ (SimpleServiceEntry 
		provider: self 
		label: 'Changelist browser'
		selector: #openOnStream:
		description: 'Open a changelist tool on this file'
		buttonLabel: 'Changes')
		argumentGetter: [ :stream | stream readOnlyStream ]
]

{
	#category : #'file service',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>services [
	"Answer potential file services associated with this class"

	^ { self serviceBrowseCSOrSTFile }
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallSaveIcon
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>buildMenu: aMenu [

	aMenu
		add: 'File in all selected'
		target: self
		selector: #fileIn:
		argumentList: { changes selectedItems }.
	
	aMenu
		addToggle: 'Compare method to current'
		target: self
		selector: #compareToCurrent:
		getStateSelector:nil
		enablementSelector: #canCompareToCurrent
		argumentList: { changes selectedItem }.

	^ aMenu
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>canCompareToCurrent [

	^ changes selectedItems size = 1
		and: [ changes selectedItem isMethodDeclaration ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>changeDescription: change [

	^ change description
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>changeSetName: aFileName [

	changeSet := CodeImporter fileNamed: aFileName.
	changeSet parseChunks.
	changes items: changeSet codeDeclarations.
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>changes [

	^ changes
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>codePane [

	^ codePane
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>compareToCurrent: aMethodDeclaration [

	| class sourceString |
	class := aMethodDeclaration targetClass.
	sourceString := (class >> aMethodDeclaration methodSelector) sourceCode.
	UIManager default
		openComparisonFrom: aMethodDeclaration contents
		to: sourceString
		belongingTo: class
		from: aMethodDeclaration
		labeled: 'Current'
		inWindowLabeled: 'Comparison to Current Version'
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>deselectAllButton [

	^ deselectAllButton
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>fileIn: aCodeDeclaration [

	aCodeDeclaration do: #import.
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>fileInSelectedButton [

	^ fileInSelectedButton
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>initialExtent [

	^ 500@600
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>initializePresenter [
	changes whenSelectedItemChanged: [ :change | change ifNotNil: [ codePane text: change contents ] ].
	changes menu: [ :menu :shifted | self buildMenu: menu ].
	selectAllButton action: [ changes selectAll ].
	deselectAllButton action: [ changes resetSelection ].
	fileInSelectedButton action: [ self fileIn: changes selectedItemsSorted ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>initializeWidgets [

	self title: 'Changes Browser'.

	changes := self newList.
	changes displayBlock: [ :elem | self changeDescription: elem ].
	changes beMultipleSelection.

	selectAllButton := self newButton.
	selectAllButton
		label: 'select all'.

	deselectAllButton := self newButton.
	deselectAllButton
		label: 'deselect all'.
		
	fileInSelectedButton := self newButton.
	fileInSelectedButton
		label: 'file in selected'.

	codePane := self newCode.
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalChangesBrowser>>selectAllButton [

	^ selectAllButton
]
