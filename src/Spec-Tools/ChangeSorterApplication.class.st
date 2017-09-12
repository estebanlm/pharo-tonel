"
A ChangeSorterApplication is spec version of the dual sorter.

ChangeSorterApplication 
	new openWithSpec
"
Class {
	#name : #ChangeSorterApplication,
	#superclass : #ComposableModel,
	#instVars : [
		'model',
		'changesListModel',
		'classesListModel',
		'methodsListModel',
		'textModel',
		'prettyPrint',
		'showDiff',
		'prettyButton',
		'diffButton'
	],
	#category : #Spec-Tools-ChangeSorter
}

{ #category : #menu }
ChangeSorterApplication class >> changeSetMenu1: aBuilder [
	<contextMenu>
	<changeSorterChangeSetList1Menu>
	
	| target |
	target := aBuilder model.
	
	target selectedChangeSet ifNotNil: [
		(aBuilder item: #'Make changes go to me')
			keyText: 'm';
			selector: #setCurrentChangeSet.
		(aBuilder item: #'New change set...')
			keyText: 'n';
			selector: #newSet ].
	
	(aBuilder item: #'Find...')
		keyText: 'f';
		selector: #findChangeSet.

	target selectedChangeSet ifNotNil: [	
		aBuilder withSeparatorAfter.
		(aBuilder item: #'Rename change set')
			keyText: 'r';
			selector: #rename.
		(aBuilder item: #'File out')
			keyText: 'o';
			selector: #fileOut.
		(aBuilder item: #'Browse methods')
			keyText: 'b';
			selector: #browseChangeSet.
		(aBuilder item: #'Browse change set')
			keyText: 'B';
			selector: #openChangeSetBrowser ].
		
]

{ #category : #menu }
ChangeSorterApplication class >> changeSetMenu2: aBuilder [
	<contextMenu>
	<changeSorterChangeSetList2Menu>
	
	| target cs |
	target := aBuilder model.
	cs := target selectedChangeSet.
	cs ifNil: [ ^self ].
	
	cs hasPreamble 
		ifTrue: [
			(aBuilder item: #'Edit preamble')
				keyText: 'p';
				selector: #addPreamble.
			(aBuilder item: #'Remove preamble')
				selector: #removePreamble ]
		ifFalse: [
			(aBuilder item: #'Add preamble')
				keyText: 'p';
				selector: #addPreamble ].

	cs hasPreamble 
		ifTrue: [
			(aBuilder item: #'Edit postscript...')
				selector: #editPostscript.
			(aBuilder item: #'Remove postscript')
				selector: #removePostscript ]
		ifFalse: [
			(aBuilder item: #'Add postscript...')
				selector: #editPostscript ].
			
		aBuilder withSeparatorAfter.
		(aBuilder item: #'Destroy change set')
			keyText: 'x';
			selector: #remove.
		
]

{ #category : #menu }
ChangeSorterApplication class >> classListMenu: aBuilder [
	<contextMenu>
	<changeSorterClassListMenu>
	
	(aBuilder item: #'Delete class from change set')
		keyText: 'd';
		selector: #forgetClass.
	(aBuilder item: #'Remove class from system')
		keyText: 'x';
		selector: #removeClass;
		withSeparatorAfter.
		
	(aBuilder item: #'Browse full')
		keyText: 'b';
		selector: #browseMethodFull;
		withSeparatorAfter.
		
	(aBuilder item: #'FileOut')
		selector: #fileOutClass.

]

{ #category : #specs }
ChangeSorterApplication class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newColumn: [:c | 
				c 
					newRow: [:r | r 
									add: #changesListModel;
									addSplitter;
									add: #classesListModel ];
					addSplitter;
					add: #methodsListModel;
					addSplitter;
					add: #textModel ].
]

{ #category : #menu }
ChangeSorterApplication class >> messageListMenu: aBuilder [
	<contextMenu>
	<changeSorterMessageListMenu>

	(aBuilder item: #'Delete method from changeSet')
		keyText: 'd';
		selector: #forgetMessage.
	(aBuilder item: #'Remove method from system')
		keyText: 'x';
		selector: #removeMessage;
		withSeparatorAfter.
		
	(aBuilder item: #'Browse full')
		keyText: 'b';
		selector: #browseMethodFull;
		withSeparatorAfter.
		
	(aBuilder item: #'FileOut')
		selector: #fileOutMessage.
	(aBuilder item: #'Senders of...')
		keyText: 'n';
		selector: #browseSendersOfMessages.
	(aBuilder item: #'Implementors of...')
		keyText: 'm';
		selector: #browseImplementorsOfMessages.
	(aBuilder item: #'Versions')
		keyText: 'v';
		selector: #browseVersions.

]

{ #category : #'menu - change set' }
ChangeSorterApplication >> addPreamble [

	self model addPreambleTo: self selectedChangeSet.
	changesListModel setSelectedItem: self selectedChangeSet
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> browseChangeSet [
	"Open a message list browser on methods in the current change set"

	| messages |
	messages := self selectedChangeSet changedMessageList select: [ :each | each isValid].	
	Smalltalk tools messageList
		browse: messages 
		title: 'Methods in Change Set ', self selectedChangeSet name .
]

{ #category : #'menu - message' }
ChangeSorterApplication >> browseImplementorsOfMessages [

	self model browseMessagesFrom: self selectedSelector
]

{ #category : #'menu - message' }
ChangeSorterApplication >> browseMethodFull [
	"Create and schedule a full Browser and then select the current class and message."

	self selectedClass ifNotNil:
		[:myClass | Smalltalk tools browser openOnClass: myClass selector: self selectedSelector ]
]

{ #category : #'menu - message' }
ChangeSorterApplication >> browseSendersOfMessages [

	self model browseSendersOfMessagesFrom: self selectedSelector
]

{ #category : #'menu - message' }
ChangeSorterApplication >> browseVersions [
	"Create and schedule a changelist browser on the versions of the 
	selected message."
	
	self selectedClass ifNotNil: [:class |
		self selectedSelector ifNotNil: [:selector || method |
			method := self createRingMethodForSelector: selector inClass: class.
			self model browseVersionsFrom: method ]]
]

{ #category : #menu }
ChangeSorterApplication >> changeSetMenu1: aMenu shifted: isShifted [ 
	"Set up aMenu to hold commands for the change-set-list pane.  This could be for a single or double changeSorter"
	
	aMenu addAllFromPragma: 'changeSorterChangeSetList1Menu' target: self.

]

{ #category : #menu }
ChangeSorterApplication >> changeSetMenu2: aMenu shifted: isShifted [ 
	"Set up aMenu to hold commands for the change-set-list pane.  This could be for a single or double changeSorter"

	aMenu addAllFromPragma: 'changeSorterChangeSetList2Menu' target: self.
	^aMenu

]

{ #category : #menu }
ChangeSorterApplication >> changeSetMenu: aMenu shifted: isShifted [
	"Set up aMenu to hold commands for the change-set-list pane.  This could be for a single or double changeSorter"

	aMenu addTitle: 'Change Set'.
	self changeSetMenu1: aMenu shifted: isShifted.
	self changeSetMenu2: aMenu shifted: isShifted.
	^ aMenu
]

{ #category : #shortcuts }
ChangeSorterApplication >> changeSetShortcuts: event from: aMorph [

	self selectedChangeSet
		ifNotNil:[
			event keyString = '<Cmd-b>' 		ifTrue: [ ^ self browseChangeSet ].
			event keyString = '<Cmd-B>' 		ifTrue: [ ^ self openChangeSetBrowser ].
			event keyString = '<Cmd-m>' 	ifTrue: [ ^ self setCurrentChangeSet ].
			event keyString = '<Cmd-n>' 		ifTrue: [ ^ self newSet ].
			event keyString = '<Cmd-o>' 		ifTrue: [ ^ self fileOut ].
			event keyString = '<Cmd-r>' 		ifTrue: [ ^ self rename ].
			event keyString = '<Cmd-p>' 		ifTrue: [ ^ self addPreamble ].
			event keyString = '<Cmd-x>' 		ifTrue: [ ^ self remove ]].
			
	event keyString = '<Cmd-f>' 				ifTrue: [ ^ self findChangeSet ].
		
]

{ #category : #api }
ChangeSorterApplication >> changeSets [

	^ self changesListModel listItems
]

{ #category : #accessing }
ChangeSorterApplication >> changesListModel [

	^ changesListModel
]

{ #category : #api }
ChangeSorterApplication >> changesMenu: aBlock [

	changesListModel menu: aBlock
]

{ #category : #api }
ChangeSorterApplication >> changesModelOn: aShortcut do: aBlock [

	changesListModel bindKeyCombination: aShortcut toAction: aBlock
]

{ #category : #menu }
ChangeSorterApplication >> classMenu: aMenu shifted: shifted [
	"Fill aMenu with items appropriate for the class list"

	self selectedClass ifNil: [ ^ nil ].
	aMenu addTitle: 'Class list'.
	aMenu addAllFromPragma: 'changeSorterClassListMenu' target: self.
	^ aMenu
]

{ #category : #shortcuts }
ChangeSorterApplication >> classShortcuts: event from: aMorph [

	self selectedClass
		ifNotNil:[
			event keyString = '<Cmd-b>' 		ifTrue: [ ^ self browseMethodFull ].
			event keyString = '<Cmd-d>' 		ifTrue: [ ^ self forgetClass ].
			event keyString = '<Cmd-x>' 		ifTrue: [ ^ self removeClass ]].
]

{ #category : #accessing }
ChangeSorterApplication >> classesListModel [

	^ classesListModel
]

{ #category : #api }
ChangeSorterApplication >> classesMenu: aBlock [

	classesListModel menu: aBlock
]

{ #category : #api }
ChangeSorterApplication >> classesOn: aShortcut do: aBlock [

	classesListModel bindKeyCombination: aShortcut toAction: aBlock
]

{ #category : #private }
ChangeSorterApplication >> createRingMethodForRemovedSelector: aSelector inClass: aClass [
	"Create RingMethod from the	removealinfo"

	| removalInfo method |
	method := RGMethodDefinition class: aClass selector: aSelector.
	removalInfo := (self selectedChangeSet changeRecorderFor: aClass) methodChanges at: aSelector ifAbsent: [ ^ method ].
	method sourcePointer: removalInfo methodInfoFromRemoval first.
	^ method
]

{ #category : #private }
ChangeSorterApplication >> createRingMethodForSelector: aSelector inClass: aClass [
	"Create RingMethod from the class compiledMethod or if it was removed from the
	removealinfo"
	(aClass includesSelector: aSelector) ifTrue:[ ^ aClass compiledMethodAt: aSelector].
	^ self createRingMethodForRemovedSelector: aSelector inClass: aClass.
]

{ #category : #api }
ChangeSorterApplication >> currentText [

	 ^ textModel getText
]

{ #category : #private }
ChangeSorterApplication >> defaultTitle [
	
	^  'Change Sorter'
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> editPostscript [
	
	self selectedChangeSet editPostscript
]

{ #category : #shortcuts }
ChangeSorterApplication >> ensureKeyBindingsFor: aWidget [

	super ensureKeyBindingsFor: aWidget.
	
	self registerChangeSetShortcuts: changesListModel.
	self registerClassShortcuts: classesListModel.
	self registerMethodShortcuts: methodsListModel.
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> fileOut [

	self selectedChangeSet fileOut
]

{ #category : #'menu - class' }
ChangeSorterApplication >> fileOutClass [

	self model fileOutClass: self selectedClass from: self selectedChangeSet
]

{ #category : #'menu - message' }
ChangeSorterApplication >> fileOutMessage [
	"Put a description of the selected message on a file"

	self selectedSelector ifNotNil: [:selector |
		Cursor write showWhile:
			[ self model fileOutSelector: selector from: self selectedClass ]]
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> findChangeSet [

	| set |
	set := self model findChangeSetIn: self changeSets.
	changesListModel setSelectedItem: set.
]

{ #category : #private }
ChangeSorterApplication >> forceChangesListRefresh [
	| sel |
	
	sel := self selectedChangeSet.
	changesListModel items: self model allChanges.
	changesListModel setSelectedItem: sel.
]

{ #category : #'menu - class' }
ChangeSorterApplication >> forgetClass [
	"Remove all mention of this class from the changeSet"

	self okToChange ifFalse: [^ self].
	self selectedClass ifNotNil: [:class |
		self model removeClass: class from: self selectedChangeSet.
		self setSelectedChangeSet: self selectedChangeSet ].

]

{ #category : #'menu - message' }
ChangeSorterApplication >> forgetMessage [

	self okToChange ifFalse: [^ self].
	self selectedSelector ifNotNil: [:selector | 
		self model 
			forgetSelector: selector 
			inClass: self selectedClass 
			fromChangeSet: self selectedChangeSet.
		self updateClassesList.
		self setSelectedClassIndex: self selectedClassIndex ]
]

{ #category : #initialization }
ChangeSorterApplication >> initialize [

	prettyPrint := false.
	showDiff := false.
	model := ChangeSorterModel new.
	SystemAnnouncer uniqueInstance weak
		when: CurrentChangeSetChanged send: #updateTitle to: self.
	super initialize.
	self initializeAnnouncements.
	
	
	
]

{ #category : #initialization }
ChangeSorterApplication >> initializeAnnouncements [
	SystemAnnouncer uniqueInstance weak 
		when:
			ClassAdded , ClassCommented , ClassRecategorized , ClassModifiedClassDefinition , ClassRemoved , ClassRenamed
				, ClassReorganized , MethodAdded , MethodModified , MethodRecategorized , MethodRemoved , ProtocolAdded
				, ProtocolRemoved
		send: #updateClassesList
		to: self
]

{ #category : #initialization }
ChangeSorterApplication >> initializePresenter [

	prettyButton activationAction: [ 
		prettyPrint := true.
		self updateTextContents ].
	prettyButton deactivationAction: [ 
		prettyPrint := false.
		self updateTextContents  ].
	diffButton activationAction: [ 
		showDiff := true.
		self updateTextContents ].
	diffButton deactivationAction: [ 
		showDiff := false.
		self updateTextContents  ].
	self registerChangeActions.
	self registerClassActions.
	self registerSelectorActions.
]

{ #category : #initialization }
ChangeSorterApplication >> initializeWidgets [

	methodsListModel := self instantiate: FastTableModel.
	classesListModel := self instantiate: FastTableModel.
	changesListModel := self instantiate: FastTableModel.
	prettyButton := self newCheckBox.
	diffButton := self newCheckBox.
	textModel := self newCode.
	 
	self setFocus.
	
	methodsListModel menu: [:menu :shifted | self messageMenu: menu shifted: shifted ].
	changesListModel menu: [:aMenu :shifted | self changeSetMenu: aMenu shifted: shifted  ].
	classesListModel menu: [:aMenu :shifted | self classMenu: aMenu shifted: shifted ].

	changesListModel items: self model allChanges.
	changesListModel displayBlock: [:item | item name ].
	textModel aboutToStyle: true.
	
]

{ #category : #menu }
ChangeSorterApplication >> messageMenu: aMenu shifted: shifted [
	"Fill aMenu with items appropriate for the message list; could be for a single or double changeSorter"

	self selectedSelector ifNil: [ ^ nil ].
	aMenu addTitle: 'Message list'.
	aMenu addAllFromPragma: 'changeSorterMessageListMenu' target: self.
	^ aMenu
]

{ #category : #shortcuts }
ChangeSorterApplication >> methodShortcuts: event from: aMorph [

	self selectedSelector
		ifNotNil:[
			event keyString = '<Cmd-b>' 		ifTrue: [ ^ self browseMethodFull ].
			event keyString = '<Cmd-d>' 		ifTrue: [ ^ self forgetMessage ].
			event keyString = '<Cmd-m>' 	ifTrue: [ ^ self browseImplementorsOfMessages ].
			event keyString = '<Cmd-n>' 		ifTrue: [ ^ self browseSendersOfMessages ].
			event keyString = '<Cmd-v>' 		ifTrue: [ ^ self browseVersions ].
			event keyString = '<Cmd-x>' 		ifTrue: [ ^ self removeMessage ]].
]

{ #category : #accessing }
ChangeSorterApplication >> methodsListModel [

	^ methodsListModel
]

{ #category : #api }
ChangeSorterApplication >> methodsMenu: aBlock [

	methodsListModel menu: aBlock
]

{ #category : #api }
ChangeSorterApplication >> methodsOn: aShortcut do: aBlock [

	methodsListModel bindKeyCombination: aShortcut toAction: aBlock
]

{ #category : #accessing }
ChangeSorterApplication >> model [

	^ model
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> newSet [

	| aSet |
	self okToChange ifFalse: [ ^ self ].
	aSet := self model createNewSet.
	aSet ifNotNil:
		[	self updateChangesList.
			changesListModel setSelectedItem: aSet ]
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> openChangeSetBrowser [
	| cs |
	
	cs := self selectedChangeSet ifNil: [^self].
	^Smalltalk tools browser openInEnvironment: (RBBrowserEnvironment new forClasses: cs changedClasses)
]

{ #category : #initialization }
ChangeSorterApplication >> registerChangeActions [
	
	changesListModel
		whenSelectedItemChanged: [:change | 
			classesListModel resetSelection.
			self updateTextContents.
			change 
				ifNil: [
					classesListModel items: {}.
					methodsListModel items: {}.
					]
				ifNotNil: [
					classesListModel items: (change changedClasses sort: [:a :b | a name < b name ]).
					 ]].
	
]

{ #category : #shortcuts }
ChangeSorterApplication >> registerChangeSetShortcuts: aWidget [

	aWidget bindKeyCombination: PharoShortcuts current browseShortcut toAction: [ self selectedChangeSet ifNotNil:[ self browseChangeSet ]].
	aWidget bindKeyCombination: $b meta shift toAction: [ self selectedChangeSet ifNotNil:[ self openChangeSetBrowser ]].
	aWidget bindKeyCombination: $m meta toAction: [ self selectedChangeSet ifNotNil:[ self setCurrentChangeSet ]].
	aWidget bindKeyCombination: $n meta toAction: [ self selectedChangeSet ifNotNil:[ self newSet ]].
	aWidget bindKeyCombination: $o meta toAction: [ self selectedChangeSet ifNotNil:[ self fileOut ]].
	aWidget bindKeyCombination: $r meta toAction: [ self selectedChangeSet ifNotNil:[ self rename ]].
	aWidget bindKeyCombination: $p meta toAction: [ self selectedChangeSet ifNotNil:[ self addPreamble ]].
	aWidget bindKeyCombination: PharoShortcuts current removeShortcut toAction: [ self selectedChangeSet ifNotNil:[ self remove ]].
	aWidget bindKeyCombination: $f meta toAction: [ self findChangeSet ].
		
]

{ #category : #initialization }
ChangeSorterApplication >> registerClassActions [
	
	classesListModel whenSelectedItemChanged: [:class | 
		methodsListModel resetSelection.
		self updateTextContents.
		textModel behavior: class.
		textModel aboutToStyle: false.
		class 
			ifNil: [ methodsListModel items: {} ]
			ifNotNil: [ methodsListModel items: (self selectedChangeSet selectorsInClass: class name) sort ]].
]

{ #category : #shortcuts }
ChangeSorterApplication >> registerClassShortcuts: aWidget [

	aWidget bindKeyCombination: PharoShortcuts current browseShortcut toAction: [ self selectedClass ifNotNil:[ self browseMethodFull ]].
	aWidget bindKeyCombination: $d meta toAction: [ self selectedClass ifNotNil:[ self forgetClass ]].
	aWidget bindKeyCombination: PharoShortcuts current removeShortcut toAction: [ self selectedClass ifNotNil:[ self removeClass ]].
]

{ #category : #shortcuts }
ChangeSorterApplication >> registerMethodShortcuts: aWidget [

	aWidget bindKeyCombination: PharoShortcuts current browseShortcut toAction: [ self selectedSelector ifNotNil:[ self browseMethodFull ]].
	aWidget bindKeyCombination: $d meta toAction: [ self selectedSelector ifNotNil:[ self forgetMessage ]].
	aWidget bindKeyCombination: PharoShortcuts current browseImplementorsShortcut toAction: [ self selectedSelector ifNotNil:[ self browseImplementorsOfMessages ]].
	aWidget bindKeyCombination: PharoShortcuts current browseSendersShortcut toAction: [ self selectedSelector ifNotNil:[ self browseSendersOfMessages ]].
	aWidget bindKeyCombination: PharoShortcuts current browseVersionsShortcut toAction: [ self selectedSelector ifNotNil:[ self browseVersions ]].
	aWidget bindKeyCombination: PharoShortcuts current removeShortcut toAction: [ self selectedSelector ifNotNil:[ self removeMessage ]].
]

{ #category : #initialization }
ChangeSorterApplication >> registerSelectorActions [

	methodsListModel whenSelectedItemChanged: [:selector |
		self updateTextContents ]
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> remove [
	"Completely destroy my change set.  Check if it's OK first"

	self okToChange ifFalse: [^ self].
	self model removeChangeSet: self selectedChangeSet prompting: true.
	self updateChangesList.
	changesListModel resetSelection
]

{ #category : #'menu - class' }
ChangeSorterApplication >> removeClass [
	"Remove the selected class from the system, at interactive user request.  Make certain the user really wants to do this, since it is not reversible.  Answer true if removal actually happened."

	(self model removeClass: self selectedClass)
		ifTrue: [ self setSelectedChangeSet: self selectedChangeSet ]
]

{ #category : #'menu - message' }
ChangeSorterApplication >> removeMessage [
	"Remove the selected message from the system."
	
	self okToChange
		ifFalse: [^ self].
	self selectedSelector
		ifNotNil: [:selector | | class method | 
			class := self selectedClass.
				(class includesSelector: selector) ifFalse:[^ self].
				method := class>>selector.
				(self model removeMethod: method inClass: class)
					ifTrue: [ self updateMessagesList ]]
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> removePostscript [

	self model removePostscriptFrom: self selectedChangeSet.
	changesListModel setSelectedItem: self selectedChangeSet
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> removePreamble [

	self selectedChangeSet removePreamble.
	changesListModel setSelectedItem: self selectedChangeSet
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> rename [

	| set |
	set := self model rename: self selectedChangeSet.
	
	changesListModel 
		updateList;
		setSelectedItem: set
]

{ #category : #api }
ChangeSorterApplication >> selectedChangeSet [

	 ^ changesListModel selectedItem
]

{ #category : #api }
ChangeSorterApplication >> selectedChangeSetIndex [

	 ^ changesListModel selectedIndex
]

{ #category : #api }
ChangeSorterApplication >> selectedClass [

	 ^ classesListModel selectedItem
]

{ #category : #api }
ChangeSorterApplication >> selectedClassIndex [

	 ^ classesListModel selectedIndex
]

{ #category : #api }
ChangeSorterApplication >> selectedSelector [

	 ^ methodsListModel selectedItem
]

{ #category : #api }
ChangeSorterApplication >> selectorsMenu: aBlock [

	methodsListModel menu: aBlock
]

{ #category : #'menu - change set' }
ChangeSorterApplication >> setCurrentChangeSet [

	self model setCurrentChangeSet: self selectedChangeSet.
]

{ #category : #initialization }
ChangeSorterApplication >> setFocus [

	self focusOrder
		add: changesListModel;
		add: classesListModel;
		add: methodsListModel;
		add: textModel.
]

{ #category : #api }
ChangeSorterApplication >> setSelectedChangeSet: aChangeSet [

	 ^ changesListModel setSelectedItem: aChangeSet
]

{ #category : #api }
ChangeSorterApplication >> setSelectedChangeSetIndex: anIndex [

	 ^ changesListModel setSelectedIndex: anIndex
]

{ #category : #api }
ChangeSorterApplication >> setSelectedClass: aClass [

	 ^ classesListModel setSelectedItem: aClass
]

{ #category : #api }
ChangeSorterApplication >> setSelectedClassIndex: anIndex [

	 ^ classesListModel setSelectedIndex: anIndex
]

{ #category : #accessing }
ChangeSorterApplication >> textModel [

	^ textModel
]

{ #category : #api }
ChangeSorterApplication >> title [

	^ super title, ' on: ', self model currentChangeSet name. 
]

{ #category : #api }
ChangeSorterApplication >> updateChangesList [

	| sel |
	sel := self selectedChangeSet.
	changesListModel items: self model allChanges.
	changesListModel setSelectedItem: sel.
]

{ #category : #api }
ChangeSorterApplication >> updateClassesList [
	
	| sel |
	sel := self selectedClass.
	
	self selectedChangeSet
			ifNil: [ classesListModel items: {} ]
			ifNotNil: [:change |	classesListModel items: (change changedClasses sort: [:a :b | a name < b name ])].
				
	classesListModel setSelectedItem: sel
]

{ #category : #api }
ChangeSorterApplication >> updateClassesListAndMessagesList [
	| sel |
	sel := methodsListModel selectedItem.
	
	self updateClassesList.
	methodsListModel setSelectedItem: sel.
	self updateMessagesList.
]

{ #category : #api }
ChangeSorterApplication >> updateMessagesList [
	| sel |
	sel := methodsListModel selectedItem.
	
	self selectedClass
			ifNil: [ methodsListModel items: {} ]
			ifNotNil: [:class | methodsListModel items: (self selectedChangeSet selectorsInClass: class name) sort].
				
	methodsListModel setSelectedItem: sel
]

{ #category : #private }
ChangeSorterApplication >> updateTextContents [

	| text |
	text :=  (self model 
				setContentsOfChangeSet: self selectedChangeSet
				forClass: self selectedClass
				andSelector: self selectedSelector
				prettyPrint: prettyPrint
				showDiff: showDiff).
	({'Method was added, but cannot be found!'. 'Added then removed (see versions)'. 'Method has been removed (see versions)'} includes: text)
		ifTrue: [ textModel aboutToStyle: false ]
		ifFalse: [ textModel aboutToStyle: true ] .
	textModel text: text.
]

{ #category : #api-events }
ChangeSorterApplication >> whenChangesListChanges: aBlock [

	changesListModel whenListChanged: aBlock
]
