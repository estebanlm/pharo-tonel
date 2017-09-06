"
I am a browser for Epicea logs in a directory.

Usage:

self open.
"
Class {
	#name : #EpLogNodeGraphModel,
	#superclass : #ComposableModel,
	#instVars : [
		'refreshButtonModel',
		'directory',
		'hiedraRulerController',
		'selectDirectoryButtonModel',
		'logNodesTreeModel',
		'directoryTextModel',
		'monitor',
		'openSettingsButtonModel',
		'hiedraCheckBoxModel'
	],
	#category : #EpiceaBrowsers-UI-Graph,
	#timestamp : 'MartinDias 8/14/2016 02:38'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel class>>open [

	^ self new
		refresh;
		openWithSpec;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel class>>spec [
	<spec: #default>

	^ SpecLayout composed newColumn: [:column |
		column add: #logNodesTreeModel.

		column 
			newRow: [ :row |
				 row 
					add: #hiedraCheckBoxModel;
					add: #refreshButtonModel" width: self inputTextHeight";
					add: #selectDirectoryButtonModel" width: self inputTextHeight";
					add: #openSettingsButtonModel;
					yourself ]
			 height: self buttonHeight - 4 ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>directory [

	^ directory ifNil: [ 
		directory := self monitor sessionStore baseLocator ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>directory: aFileReference [

	directory := aFileReference.
	
	self refresh.
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>hiedraCheckBoxModel [
	^ hiedraCheckBoxModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>initializeHiedraCheckBoxModel [

	hiedraCheckBoxModel
		help: 'Analyze and display connections between log files.';
		label: 'Link logs';
		state: false;
		whenChangedDo: [ self refresh ].

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>initializeHiedraController [

	hiedraRulerController := HiRulerController new.
	
	hiedraRulerController treeModel: logNodesTreeModel.
	logNodesTreeModel whenRootsChanged: [
		hiedraRulerController updateFromTree ].
	
	hiedraRulerController rulerBuilder
		rowSize: self rowSize;
		columnSize: self rowSize // 3.
	
	hiedraRulerController rulerBuilder addLinkBuilder: [ :linkBuilder |
		linkBuilder targetsBlock: [ :node | node referencedNodes ] ].

	"Set zero inset, else there is an empty gap cutting Hiedra links."
	logNodesTreeModel rowInset: 0.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>initializeLogNodesTreeModel [

	self initializeHiedraController.

	logNodesTreeModel columns:	{	
		hiedraRulerController newTreeColumnModel
			initialWidth: 50
			yourself.

		TreeColumnModel new
			displayBlock: [ :item | item content asMorph ];
			yourself.
	}.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>initializeOpenSettingsButtonModel [

	openSettingsButtonModel
		label: 'Dashboard';
		action: [ self openDashboard ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>initializePresenter  [
	super initializePresenter.
	
	self initializeSelectedDirectoryButtonModel.
	self initializeLogNodesTreeModel.
	self initializeRefreshButtonModel.
	self initializeHiedraCheckBoxModel.
	self initializeOpenSettingsButtonModel.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>initializeRefreshButtonModel [

	refreshButtonModel 
		help: 'Refresh logs from this directory';
		icon: (self iconNamed: #smallUpdate);
		label: 'Refresh';
		action: [ self refresh ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>initializeSelectedDirectoryButtonModel [
	
	selectDirectoryButtonModel 
		help: 'Select directory to browse logs (i.e. files with ombu extension)';
		icon: (self iconNamed: #openIcon);
		label: 'Directory';
		action: [ self selectDirectory ]

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>initializeWidgets [

	self instantiateModels: {
		#hiedraCheckBoxModel -> #CheckBoxModel.
		#selectDirectoryButtonModel -> #ButtonModel.
		#logNodesTreeModel -> #TreeModel.
		#refreshButtonModel -> #ButtonModel.
		#openSettingsButtonModel -> #ButtonModel.
		}
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>isMonitorDirectory [

	^ self monitor sessionStore directory asFileReference = self directory asFileReference 
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>logNodesTreeModel [
	^ logNodesTreeModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>monitor [
	
	^ monitor ifNil: [ EpMonitor current ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>monitor: anEpMonitor [

	monitor := anEpMonitor

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>openDashboard [

	EpDashboardModel open
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>openSettingsButtonModel [
	^ openSettingsButtonModel
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>refresh [

	self refreshLogNodesTreeModel.

]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>refreshButtonModel [
	^ refreshButtonModel
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>refreshLogNodesTreeModel [

	| nodes |
	nodes := #().
	[	nodes := EpFileLogNode fromAllLogsIn: self directory.
		nodes := nodes sorted: [ :a :b | a modificationTime >= b modificationTime ] ]
			on: FileSystemError 
			do: [ :error | self inform: error asString ].

	self flag: #fix. "hacky"
	self isMonitorDirectory ifTrue: [
		| currentGlobalName |
		currentGlobalName := self monitor sessionStore store globalName.
		nodes := nodes reject: [:each | each globalName = currentGlobalName ].
		nodes := { EpMonitorLogNode for: self monitor }, nodes.
	].

	hiedraCheckBoxModel state ifTrue: [
		nodes 
			do: [ :node | node populateReferencedNodesWith: nodes ]
			displayingProgress: ('Analyzing ', directory asString)].

	logNodesTreeModel roots: nodes.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>rowSize [

	^ 23
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>selectDirectory [

	(UIManager default chooseDirectoryFrom: self directory)
		ifNotNil: [ :selectedDirectory | self directory: selectedDirectory ]
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNodeGraphModel>>selectDirectoryButtonModel [

	^ selectDirectoryButtonModel
]
