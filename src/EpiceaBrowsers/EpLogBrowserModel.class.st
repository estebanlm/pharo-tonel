"
I am a Spec browser for an EpLog.

For example, open with:

self open

"
Class {
	#name : #EpLogBrowserModel,
	#superclass : #ComposableModel,
	#instVars : [
		'log',
		'entryContentModel',
		'itemsModel',
		'toolbarModel',
		'andFilter',
		'selectionDeferrer',
		'cachedLogEntries',
		'commentsLog',
		'monitor',
		'cachedItems',
		'showEntryItemMenu'
	],
	#category : #EpiceaBrowsers-UI-Log,
	#timestamp : 'MartinDias 2/18/2017 17:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel class>>defaultLog [

	^ EpMonitor current log
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel class>>newWithLog: aLog [

	^ self new
		theLog: aLog;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel class>>open [

	^ self openWithLog: self defaultLog
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel class>>openWithLog: aLog [

	^ (self newWithLog: aLog)
		refresh;
		openWithSpec;
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel class>>spec [
	<spec: #default>

	^ SpecLayout composed newColumn: [:column |
		column 
			add: #itemsModel origin: 0@0 corner: 1@0.6;
			addSplitter;
			add: #toolbarModel height: self toolbarHeight;
			add: #entryContentModel origin: 0@0.6 corner: 1@1;
			yourself ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>addFilter: aFilter [

	(andFilter subFilters includes: aFilter) ifTrue: [ ^self ].
	
	andFilter := EpAndFilter withAll: (andFilter subFilters copyWith: aFilter).
	self refresh.
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>addMenuItemsForSelectedItemsIn: aMenu [

	aMenu addGroup: [ :aGroup | 
		self menuActionsForSelectedItems do: [ :oldStyleMenuItemArray | 
			aGroup addItem: [ :anItem | 
				anItem
					name: oldStyleMenuItemArray first;
					description: oldStyleMenuItemArray third;
					icon: (self iconNamed: oldStyleMenuItemArray fourth);
					action: [ self perform: oldStyleMenuItemArray second ] ] ] ].

	aMenu addGroup: [ :aGroup | 
		aGroup addItem: [ :anItem | 
			anItem
				name: 'Filters';
				icon: (self iconNamed: #smallFindIcon);
				subMenu: self filtersSubMenu ] ].

	aMenu addGroup: [ :aGroup | 
		aGroup addItem: [ :anItem | 
			anItem
				name: 'File Out';
				description: 'Write selected entries to an Ombu file';
				icon: (self iconNamed: #smallSaveAsIcon);
				action: [ self fileOutSelection ] ] ].

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>applyAllChangesAndCloseWindow [

	self applyChangesIn: self entriesWithCodeChanges.
	self window close.

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>applyChangesIn: entries [

	entries ifEmpty: [ ^ self inform: 'No code changes to apply' ].

	EpLogBrowserOperationFactory new
		logBrowserModel: self;
		entries: entries;
		errorHandlerBlock: self operationsErrorHandlerBlock;
		applyCodeChanges.

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>applyCompleteRefactoringInSelection [

	| entries |
	entries := self selectedEntryItems.
	entries ifEmpty: [ ^ self inform: 'No code changes to apply' ].
	
	EpLogBrowserOperationFactory new
		logBrowserModel: self;
		entries: { entries first };  "TODO: only first?"
		errorHandlerBlock: self operationsErrorHandlerBlock;	
		applyCompleteRefactoring.

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>applyPropagateRefactoringInSelection [

	| entries |
	entries := self selectedEntryItems.
	entries ifEmpty: [ ^ self inform: 'No code changes to apply' ].
	
	EpLogBrowserOperationFactory new
		logBrowserModel: self;
		entries: { entries first };  "TODO: only first?"
		errorHandlerBlock: self operationsErrorHandlerBlock;
		applyPropagateRefactoring.

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>applySelectedChanges [

	self applyChangesIn: self selectedCodeChanges

]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>beApplyMode [

	self title: 'Epicea - Apply Changes'.
	self toolbarModel beApplyMode.
	showEntryItemMenu := false.

]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>beHistoryMode [

	self title: 'Epicea - Log Browser'.
	self toolbarModel beHistoryMode.
	showEntryItemMenu := true.

]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>beRevertMode [

	self title: 'Epicea - Revert Changes'.
	self toolbarModel beRevertMode.
	showEntryItemMenu := false.

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>browseSelection [

	| selectionSize |
	selectionSize := self selectedEntryReferences size.	
	selectionSize > 3 ifTrue: [
		(self confirm: 'Do you want to open a browser for each code changes? (', selectionSize asString, ' items selected)')
			ifFalse: [ ^self ] ].

	self selectedEntryItems 
		select: [ :each | each entry content isCodeChange ] 
		thenDo: [ :each | each browseItem ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>cachedItems [

	^ cachedItems ifNil: [ cachedItems := WeakValueDictionary new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>cachedLogEntries [
	"Answer log entries.
	Check size since the log might be current Monitor's, so it can grow."

	^ (cachedLogEntries isNotNil and: [ cachedLogEntries size = log entriesCount ])
		ifTrue: [ cachedLogEntries ]
		ifFalse: [
			'Reading log'
				displayProgressFrom: 0 to: 1 
				during: [ cachedLogEntries := log entries reversed ]
			]

]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>cleanEntryContentModel [

	self refreshEntryContentModelWith: #()

]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>codeChangesMenuActions [

	^ { 
		{ 'Apply...'.
		#openPreviewToApplySelectedChanges.
		'Preview the application of selected code changes (open a new window to show the effect of re-applying the changes in current image)'.
		#smallRedoIcon.
		$p command }.
		{ 'Revert...'.
		#openPreviewToRevertSelectedChanges.
		'Preview the reversion of selected code changes (open a new window to show the effect of reverting the changes in current image)'.
		#smallUndoIcon.
		$r command }.
		{ 'Browse current'.
		#browseSelection.
		'Browse working copy of entity affected in the selected event(s)'.
		#nautilusIcon.
		$b command }.
	}

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>commentSelection [

	| items newCommentOrNil oldComment entryReferences |
	items := self selectedEntryItems.
	entryReferences := items collect: #reference.
	oldComment := items anyOne oldComment.
		
	newCommentOrNil := UIManager default
		multiLineRequest: 'Enter a comment for the selection' 
		initialAnswer: oldComment
		answerHeight: 250.

	newCommentOrNil ifNil: [ ^ self ].
	
	self logOffEvent:
		(EpLogEntriesComment 
			entryReferences: entryReferences 
			oldComment: oldComment 
			newComment: newCommentOrNil)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>commentsLog [
	
	^ commentsLog ifNil: [ self monitor log ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>commentsLog: anEpLog [
	
	commentsLog := anEpLog
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>entries [

	^ log entryReferences collect: [:each | log entryFor: each ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>entriesWithCodeChanges [

	^ self entries select: [:each | each content isCodeChange ]
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>entryContentModel [
	^ entryContentModel 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>entryItems [

	^ log entryReferences collect: [:each |
		self itemForEntryReference: each ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>eventsMenuActions  [

	^ {
		{ 'Comment'. 
		#commentSelection.
		'Edit comment of selected entries'.
		#announcementIcon. 
		$c command }.
	}

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>fileOutSelection [

	| entries outputDirectory |
	entries := (self selectedEntryItems collect: [ :each | each entry ]) reversed.
	outputDirectory := log store directory.
	
	EpOmbuExporter askFileNameAndFileOut: entries in: outputDirectory.
]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterAfter [

	self selectedEntryItems ifNotEmpty: [ :items |
		| time |
		time := items last entry tags at: EpLog timeKey.
		self addFilter: (EpPluggableFilter after: time) ]
]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterAllChangesToSelection [

	| changes |
	changes := (self selectedEntryItems collect: [ :each | each entry content ]).

	changes size = 1 ifFalse: [ ^ self inform: 'Should select a single method change' ]. 
	changes anyOne isEpMethodChange ifFalse: [ ^ self inform: 'Should select a method' ]. 

	self addFilter: (EpPluggableFilter isMethod: changes anyOne methodAffected).
]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterAllChangesToSelectionBehavior [

	| changes |
	changes := self selectedEntryItems collect: [ :each | each entry content ].

	changes size = 1 ifFalse: [ ^ self inform: 'Should select a single change, either to a class or a trait' ]. 
	changes anyOne isEpMethodChange ifFalse: [ ^ self inform: 'Should select a method' ]. 

	self addFilter: (EpPluggableFilter isBehaviorNamed: changes anyOne behaviorAffectedName).
]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterAllChangesToSelectionPackage [

	| changes |
	changes := (self selectedEntryItems collect: [ :each | each entry content ]).

	changes size = 1 ifFalse: [ ^ self inform: 'Should select a single change' ]. 

	self addFilter: (EpPluggableFilter isPackageNamed: changes anyOne affectedPackageName).
]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterBefore [

	self selectedEntryItems ifNotEmpty: [ :items |
		| time |
		time := items first entry tags at: EpLog timeKey.
		self addFilter: (EpPluggableFilter before: time) ]
]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterImpactCodeChanges [

	self addFilter: (EpImpactCodeChangeFilter new environment: self class environment; yourself)
]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterLatestCodeChanges [

	self addFilter: (EpLatestCodeChangeFilter new logBrowserModel: self; yourself)
]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterSelection [

	| references |
	references := self selectedEntryReferences.

	references ifEmpty: [ ^self inform: 'Selection is empty' ].

	self addFilter: (EpEntryReferencesFilter new
		theLog: log; 
		rejectedEntryReferences: references; 
		yourself).

]

{
	#category : #'menu - filters',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filterToday [

	self addFilter: EpPluggableFilter todayFilter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filteredEntries [
	
	^ self filteredEntryReferences collect: [:each | log entryFor: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filteredEntriesCount [

	^ self filteredEntryReferences size

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filteredEntryReferences [

	^ andFilter subFilters 
		ifEmpty: [ log entryReferences ]
		ifNotEmpty: [
			self cachedLogEntries
				select: [:each | andFilter accepts: each ]
				thenCollect: [:each | log referenceTo: each ] ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filters [

	^ andFilter subFilters
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>filtersSubMenu [
	
	| aMenu |
	aMenu := MenuModel new.
	
	aMenu addGroup: [ :aGroup |
		aGroup addItem: [ :anItem |
			anItem
				name: 'Clean filters (', self filters size asString, ' active)';
				icon: (self iconNamed: #smallDelete);
				action: [ self removeAllFilters ] ].
		].

	aMenu addGroup: [ :aGroup |

		aGroup addItem: [ :anItem |
			anItem 
				name: EpLatestCodeChangeFilter title;
				description: EpLatestCodeChangeFilter comment;
				icon: (self iconNamed: #smallFind);
				action: [ self filterLatestCodeChanges ] ].

		aGroup addItem: [ :anItem |
			anItem 
				name: EpImpactCodeChangeFilter title;
				description: EpImpactCodeChangeFilter comment;
				icon: (self iconNamed: #smallFind);
				action: [ self filterImpactCodeChanges ] ].
	].

	aMenu addGroup: [ :aGroup |

		aGroup addItem: [ :anItem |
			anItem 
				name: EpEntryReferencesFilter title;
				icon: (self iconNamed: #smallFind);
				action: [ self filterSelection ] 
			].
		
		aGroup addItem: [ :anItem |
			anItem 
				name: 'Show only changes to this method';
				description: 'Show only additions, modifications or removals of this method.';
				icon: (self iconNamed: #smallFind);
				action: [ self filterAllChangesToSelection ] ].

		aGroup addItem: [ :anItem |
			anItem 
				name: 'Show only changes to this class or trait';
				description: 'Show only changes in the scope of this class or trait.';
				icon: (self iconNamed: #smallFind);
				action: [ self filterAllChangesToSelectionBehavior ]
			].
				
		aGroup addItem: [ :anItem |
			anItem 
				name: 'Show only changes in this package';
				description: 'Show only additions, modifications or removals of this package.';
				icon: (self iconNamed: #smallFind);
				action: [ self filterAllChangesToSelectionPackage ]
			].
	].


	aMenu addGroup: [ :aGroup |

		aGroup addItem: [ :anItem |
			anItem 
				name: 'Show only if done today';
				icon: (self iconNamed: #calendar);
				action: [ self filterToday ] ].

		aGroup addItem: [ :anItem |
			anItem 
				name: 'Hide events done after';
				icon: (self iconNamed: #calendar);
				action: [ self filterBefore ] ].

		aGroup addItem: [ :anItem |
			anItem 
				name: 'Hide events done before';
				icon: (self iconNamed: #calendar);
				action: [ self filterAfter ] ].
	].

	aMenu addGroup: [ :aGroup |
		EpPluggableFilter allFilters do: [ :aFilter |
			aGroup addItem: [ :anItem |
				anItem 
					name: aFilter title;
					icon: (self iconNamed: #smallFind);
					description: aFilter title;
					action: [ self addFilter: aFilter ] ] ]
		].

	^ aMenu
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>initialExtent [
	^ 550 @ 700

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>initialize [

	super initialize.
	
	andFilter := EpAndFilter withAll: #().
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>initializeEntryContentModel [

	entryContentModel showOptions: false.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>initializeItemsModel [

	itemsModel
		beMultipleSelection;
"		autoDeselect: true; -> not implemented yet?"
		displayBlock: [ :entryReference | self morphForItemAt: entryReference ];
		whenSelectionChanged: [ self refreshEntryContentModelDeferrer schedule ];
		menu: [ self menuMorphForSelectedItems ].
		
	itemsModel announcer weak
		when: WidgetBuilt
		send: #initializeItemsModelPerformFilterWorkaround: to: self.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>initializeItemsModelPerformFilterWorkaround: widgetBuildAnnouncement [
	"Problem: FastTableModel sends #explicitFilter to the FTTableMorph in MorphicFastTableAdapter>>buildWidget but the EpEntryItem in the itemsModel are not compatible."
	
	widgetBuildAnnouncement widget disableFunction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>initializePresenter [

	super initializePresenter.

	self initializeItemsModel.
	self initializeToolbarModel.
	self initializeEntryContentModel.
	
	self beHistoryMode.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>initializeToolbarModel [

	toolbarModel logBrowserModel: self.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>initializeWidgets [

	self instantiateModels: {
		#itemsModel -> #FastTableModel.
		#toolbarModel -> #EpLogBrowserToolbarModel.
		#entryContentModel -> #DiffModel. 
		}.

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>inspectSelection [

	self selectedEntryItems do: #inspect
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>itemForEntryReference: entryReference [

	^ self cachedItems
		at: entryReference
		ifPresent: [:item | item ]
		ifAbsentOrNil: [ 
			| newItem |
			newItem := self newItemForEntryReference: entryReference.
			self cachedItems at: entryReference put: newItem.
			newItem ]
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>itemsModel [
	^ itemsModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>log [
	^ log
]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>logOffEvent: anEvent [

	self commentsLog 
		addEntryWith: anEvent
		tags: [ :tags |
			tags at: EpLog authorKey put: self monitor author.
			tags at: EpLog timeKey put: self monitor time ].
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>menuActionsForSelectedItems [

	| selectedReferences |
	selectedReferences := self selectedEntryReferences.

	selectedReferences isEmpty ifTrue: [ ^#() ].
	
	selectedReferences size = 1 ifTrue: [
		| event |
		event := (self itemForEntryReference: selectedReferences anyOne) event.
		(event isEpRefactoring and: [ event canBuildRBRefactoring ])
			ifTrue: [ ^ self refactoringMenuActions, self eventsMenuActions ]].

	^ self codeChangesMenuActions, self eventsMenuActions

]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>menuMorphForSelectedItems [

	| aMenu |
	aMenu := MenuModel new.

	showEntryItemMenu ifTrue: [ self addMenuItemsForSelectedItemsIn:	aMenu ].

	^ aMenu buildWithSpecAsPopup

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>monitor [
	
	^ monitor ifNil: [ EpMonitor current ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>morphForItemAt: entryReference [

	^ [ (self itemForEntryReference: entryReference) asMorph ]
			on: NotFound do: [:error | error asString asMorph ] "Enforce... remove it?"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>newItemForEntryReference: entryReference [

	| entry triggers|
	entry := log entryFor: entryReference.
	
	triggers := [ self triggerItemsFor: entry ] 
		on: NotFound 
		do: [ #() ]. "Just hide it... not an esential information"
	
	^ EpEntryItem new
		browser: self;
		entry: entry;
		triggerItems: triggers;
		yourself
]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>openPreviewToApplySelectedChanges [

	| entries previewLog |
	entries := self selectedCodeChanges.
	entries ifEmpty: [ entries := self filteredEntries ].
	entries ifEmpty: [ ^ self inform: 'No changes to preview apply' ].

	previewLog := EpLogBrowserOperationFactory new
		logBrowserModel: self;
		entries: entries;
		errorHandlerBlock: self operationsErrorHandlerBlock;
		newApplyPreviewLog.

	previewLog isEmpty
		ifTrue: [ self inform: 'Preview is empty (no changes to apply in current image)' ]
		ifFalse: [ previewLog browseEvents beApplyMode ]
]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>openPreviewToRevertSelectedChanges [

	| entries previewLog |
	entries := self selectedCodeChanges.
	entries ifEmpty: [ entries := self filteredEntries ].
	entries ifEmpty: [ ^ self inform: 'No changes to preview revert' ].

	previewLog := EpLogBrowserOperationFactory new
		logBrowserModel: self;
		entries: entries;
		errorHandlerBlock: self operationsErrorHandlerBlock;
		newRevertPreviewLog.

	previewLog isEmpty
		ifTrue: [ self inform: 'Preview is empty (no changes to revert in current image)' ]
		ifFalse: [ previewLog browseEvents beRevertMode ]
]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>operationsErrorHandlerBlock [

	^ [ :error | | message |
		message := self title, ' error on operation: ', error asString.
		message logCr.
		self inform: message. ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>refactoringMenuActions [

	^ {
		{ 'Apply refactoring'.
		#applyCompleteRefactoringInSelection.
		'Apply selected refactoring'.
		#smallRedoIcon.
		$y command }.
		{ 'Apply secondary effects of refactoring'.
		#applyPropagateRefactoringInSelection.
		'Apply only the secondary effects of the selected refactoring'.
		#smallRedoIcon.
		$s command }
	}
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>refresh [

	"Refresh log"
	itemsModel resetSelection. "Needed, else #items: can silently fail"
	itemsModel items: self filteredEntryReferences.

	"Refresh toolbar"	
	toolbarModel refresh.

]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>refreshEntryContentModel [

	self refreshEntryContentModelWith: self selectedEntryItems

]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>refreshEntryContentModelDeferrer [
		
	^ selectionDeferrer ifNil: [
		selectionDeferrer := OmDeferrer 
			send: #refreshEntryContentModel
			to: self
			after: 150 milliSeconds ]
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>refreshEntryContentModelWith: selectedItems [

	selectedItems size = 1
		ifTrue: [
			| item |
			item := selectedItems anyOne.
			
			entryContentModel 
				showOnlyDestination: (item oldStateString isEmptyOrNil);
				showOnlySource: (item newStateString isEmptyOrNil);
				leftText: item oldStateString;
				rightText: item newStateString ]
		ifFalse: [
			entryContentModel
				leftText: '';
				rightText: '';
				showOnlyDestination: true ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>removeAllFilters [

	andFilter := EpAndFilter withAll: #().
	self refresh.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>removeFilter: aFilter [

	andFilter := EpAndFilter withAll: (andFilter subFilters copyWithout: aFilter).
	self refresh.
]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>revertAllChangesAndCloseWindow [

	self revertChangesIn: self entriesWithCodeChanges.
	self window close.

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>revertChangesIn: entries [

	entries ifEmpty: [ ^ self inform: 'No code changes to revert' ].

	EpLogBrowserOperationFactory new
		logBrowserModel: self;
		entries: entries;
		errorHandlerBlock: self operationsErrorHandlerBlock;
		revertCodeChangesInPreviewMode.

]

{
	#category : #'menu - operations',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>revertSelectedChanges [

	self revertChangesIn: self selectedCodeChanges

]

{
	#category : #'menu - accessing',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>selectedCodeChanges [

	^ self selectedEntryItems 
		select: [ :each | each entry content isCodeChange ]
		thenCollect: [ :each | each entry ]
]

{
	#category : #'menu - accessing',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>selectedEntryItems [

	^ self selectedEntryReferences collect: [:each |
		self itemForEntryReference: each ]
]

{
	#category : #'menu - accessing',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>selectedEntryReferences [
	self flag: #todo. "Workaround: FastTableModel can return nil"

	^ itemsModel selectedItemsSorted select: [:each | each isNotNil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>theLog [
	^ log
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>theLog: aLog [

	cachedItems := nil.
	cachedLogEntries := nil.
	log := aLog.
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>toolbarModel [
	^ toolbarModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>totalEntriesCount [

	^ self theLog entriesCount
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserModel>>triggerItemsFor: anEntry [

	^ self log 
		triggererReferenceOf: anEntry 
		ifPresent: [ :triggerEntryReference | 
			| triggerItem |
			triggerItem := self itemForEntryReference: triggerEntryReference.
			triggerItem triggerItems, { triggerItem } ]
		ifAbsent: [ #() ]

]
