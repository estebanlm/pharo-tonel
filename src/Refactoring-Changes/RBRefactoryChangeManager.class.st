"
I am a change manager keeping track of all changes applied by the refactory manager. Typically there is only a single
instance of me used in the system, so all changes can be globally added/inspected/ executed and undone/redone.

The size of my undo list is configurable in the settings browser.
"
Class {
	#name : #RBRefactoryChangeManager,
	#superclass : #Object,
	#instVars : [
		'undo',
		'redo',
		'isPerformingRefactoring'
	],
	#classVars : [
		'Instance',
		'UndoSize'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:46'
}

{
	#category : #change-factory,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>changeFactory [
	^self instance changeFactory
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>initialize [
	self nuke.
	UndoSize := 20
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>instance [
	^ Instance ifNil: [ Instance := self basicNew initialize ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>new [
	^ self shouldNotImplement
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>nuke [
	Instance notNil ifTrue: [ Instance release ].
	Instance := nil
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #refactoring)
		label: 'Refactoring Engine';
		parent: #codeBrowsing;
		description: 'Settings related to the refactoring tools';
		with: [ 
					(aBuilder setting: #undoSize)
						target: self;
						label: 'Undo size';
						parentName: #refactoring ]
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>undoSize [
	^ UndoSize
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>undoSize: anInteger  [
	UndoSize := anInteger max: 0
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager class>>unload [
	self nuke
]

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>addUndo: aRefactoringChange [
	undo addLast: aRefactoringChange.
	undo size > UndoSize
		ifTrue: [ undo removeFirst ].
	redo := OrderedCollection new
]

{
	#category : #change-factory,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>changeFactory [
	^ RBRefactoryChangeFactory new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>clearUndoRedoList [
	undo := OrderedCollection new.
	redo := OrderedCollection new
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>connectToChanges [
	SystemAnnouncer uniqueInstance weak
		when: CategoryAdded,
			CategoryRemoved,
			CategoryRenamed,
			ClassAdded,
			ClassModifiedClassDefinition,
			ClassRemoved,
			ClassRenamed,
			ClassReorganized,
			MethodAdded,
			MethodModified,
			MethodRemoved,
			ProtocolAdded,
			ProtocolRemoved
		send: #update:
		to: self.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>disconnectFromChanges [
	SystemAnnouncer uniqueInstance unsubscribe: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>hasRedoableOperations [
	^ redo isEmpty not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>hasUndoableOperations [
	^ undo isEmpty not
]

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>ignoreChangesWhile: aBlock [
	isPerformingRefactoring
		ifTrue: [ ^ aBlock value ].
	isPerformingRefactoring := true.
	aBlock ensure: [ isPerformingRefactoring := false ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>initialize [
	undo := OrderedCollection new.
	redo := OrderedCollection new.
	isPerformingRefactoring := false.
	self connectToChanges
]

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>performChange: aRefactoringChange [
	self ignoreChangesWhile: [ self addUndo: aRefactoringChange execute ]
]

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>redoChange [
	^ redo last
]

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>redoOperation [
	redo isEmpty
		ifTrue: [ ^ self ].
	self ignoreChangesWhile: [ 
		| change |
		change := redo removeLast.
		undo add: change execute ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>release [
	self disconnectFromChanges.
	super release.	
]

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>undoChange [
	^ undo last
]

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>undoOperation [
	undo isEmpty
		ifTrue: [ ^ self ].
	self ignoreChangesWhile: [ 
		| change |
		change := undo removeLast.
		redo add: change execute ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeManager>>update: anEvent [
	isPerformingRefactoring
		ifFalse: [ self clearUndoRedoList ]
]
