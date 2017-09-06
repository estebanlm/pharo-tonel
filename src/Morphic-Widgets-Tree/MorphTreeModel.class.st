"
I'm the base class for tree models.  See ClassListExample for basic usage.
"
Class {
	#name : #MorphTreeModel,
	#superclass : #Model,
	#instVars : [
		'selection',
		'rootItems',
		'autoMultiSelection',
		'headerLabel',
		'multiSelection',
		'wrapBlockOrSelector',
		'isCheckList',
		'enabled'
	],
	#category : #Morphic-Widgets-Tree,
	#timestamp : '<historical>'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel class>>exampleCheckList1 [
	"self exampleCheckList1"
	Cursor wait 
		showWhile: [
			^ self new
				beCheckList;
				rootItems: (Object allSubclasses sort: [:a :b | a name <= b name]);
				 headerLabel: 'Sub-classes';
				 openDialogWindowIn: World title: 'All Object sub-classes ready to be checked']
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel class>>exampleCheckList2 [
	"self exampleCheckList2"
	| model |
	model := self new rootItems: Morph methods.
	model
		 wrapBlockOrSelector: #selector;
		 autoMultiSelection: true;
		 headerLabel: 'Plop';
		 beCheckList.
	^ (model openDialogWindowIn: World title: 'All Morph methods')

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel class>>exampleCheckList3 [
	"self exampleCheckList3"
	Cursor wait 
		showWhile: [
			^ ((self new
				beCheckList;
				autoMultiSelection: true;
				rootItems: (Object allSubclasses sort: [:a :b | a name <= b name]);
				 headerLabel: 'Sub-classes';
				defaultTreeMorph) 
					buildContents;
					embeddedInMorphicWindowLabeled: 'All Object sub-classes ready to be checked') 
						openInWorld]
]

{
	#category : #'item handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel class>>itemsList: itemsList [

	^ self new
		rootItems: itemsList;
		yourself
]

{
	#category : #'item handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel class>>itemsList: itemsList itemsHeaderName: aName [

	^ self new
		rootItems: itemsList;
		headerLabel: aName;
		yourself
]

{
	#category : #'item handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel class>>itemsList: itemsList itemsHeaderName: aName wrapBlockOrSelector: wrapBlockOrSelector [

	^ self new
		wrapBlockOrSelector: wrapBlockOrSelector;
		rootItems: itemsList;
		headerLabel: aName;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel class>>theme [
	^ Smalltalk ui theme
]

{
	#category : #'keyboard managing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>arrowEvent: event key: aChar target: aMorph [
	"Give model the capability of handle a key before is handled by MorphTreeListManager"
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>autoMultiSelection [
	^ autoMultiSelection ifNil: [autoMultiSelection := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>autoMultiSelection: aBoolean [
	autoMultiSelection := aBoolean

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>beCheckList [
	self isCheckList: true

]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>collapseAll [
	self  requestView:  MorphTreeChangeRequest collapseAll
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>collapseNodePath: aNodePath [
	self  requestView: (MorphTreeChangeRequest collapseNodePath: aNodePath)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>deeplyDetect: aBlock  [
	self rootNodes
		do: [:sub | (sub deeplyDetect: aBlock)
				ifNotNil: [:found | ^ found]].
	^ nil 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>defaultChunkSize [
	^ nil
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>defaultMorphIn: aThemable [
	^ self defaultTreeMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>defaultPageSize [
	^ nil
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>defaultTreeMorph [
	|  col |
	col := MorphTreeColumn new 
		rowMorphGetSelector: [:node | StringMorph contents: node item asString].
	
	self headerLabel
		ifNotNil: [	col headerButtonLabel: self headerLabel font: nil].
			
	^ (self treeMorphClass on: self) 
			columns:  (Array with: col);
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			resizerWidth: 0;
			columnInset: 0; 
			rowInset: 2; 
			keystrokeActionSelector: #keyStroke:;
			"preferedPaneColor: Color white;"
			multiSelection: self multiSelection;
			autoMultiSelection: self autoMultiSelection;
			itemStringGetter: [:item | self wrapItem: item];
			isCheckList: self isCheckList";
			rowColorForEven: Color veryLightGray muchLighter odd: Color white".
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>deselectAll [
	self  requestView: MorphTreeChangeRequest deselectAll
]

{
	#category : #dialog,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>dialogWindowIn: aWindow title: aTitle [
	^ self dialogWindowIn: aWindow title: aTitle selectedtems: Array new
]

{
	#category : #dialog,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>dialogWindowIn: aWindow title: aTitle selectedtems: aCollection  [
	| dialog dialogMorph |
	dialog := self theme
				newPluggableDialogWindowIn: aWindow
				title: aTitle
				for: (dialogMorph := self defaultMorphIn: aWindow).
	dialogMorph buildContents; selectedItems: aCollection.
	dialog minimumExtent: 300 @ 500.
	dialog beResizeable.
	^ dialog 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>disable [
	self enabled: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>enable [
	self enabled: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>enabled [
	^ enabled ifNil: [ enabled := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>enabled: aBoolean [
	aBoolean ~= enabled
		ifTrue: [ 
			enabled := aBoolean.
			self  requestView: MorphTreeChangeRequest enabled]
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>expandAll [
	self  requestView: MorphTreeChangeRequest expandAll 
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>expandAllFromNode: aNode [
	self  requestView: (MorphTreeChangeRequest expandAllFromNode: aNode)

]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>expandItemPath: anItemPath [
	self  requestView: (MorphTreeChangeRequest expandItemPath: anItemPath)
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>expandNodePath: aNodePath [
	self requestView: (MorphTreeChangeRequest expandNodePath:  aNodePath)
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>expandRoots [
	self requestView: (MorphTreeChangeRequest expandRoots)
]

{
	#category : #dialog,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>headerLabel [

	^ headerLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>headerLabel: aString [
	
	headerLabel := aString
]

{
	#category : #help-text,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>helpText [

	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>isCheckList [
	^ isCheckList ifNil: [isCheckList := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>isCheckList: aBoolean [
	^ isCheckList := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>keyStroke: anEvent [

	anEvent keyString =  '<Cmd-a>'
		ifTrue: [ self selectAll ].
		
	anEvent keyString =  '<Cmd-A>'
		ifTrue: [ self deselectAll ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>keyStroke: anEvent from: aTreeView [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>menu: menu shifted: b [
	^ menu
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>multiSelection [
	^ multiSelection ifNil: [multiSelection := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>multiSelection: aBoolean [
	multiSelection := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>okToDiscardEdits  [
	^ self canDiscardEdits  or: [self promptForCancel]
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>on: anAnnouncementClass send: aSelector to: anObject [
	self announcer when: anAnnouncementClass send: aSelector to: anObject
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>onSelectionChangeSend: aSelector to: anObject [
	self on: MorphTreeSelectionChanged send: aSelector to: anObject
]

{
	#category : #dialog,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>openDialogWindowIn: aWindow title: aTitle [
	^ self openDialogWindowIn: aWindow title: aTitle selectedtems: Array new
]

{
	#category : #dialog,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>openDialogWindowIn: aWindow title: aTitle selectedtems: aCollection  [
	| dialog |
	dialog := self dialogWindowIn:  aWindow title: aTitle selectedtems: aCollection.
	aWindow openModal: dialog.
	^ dialog cancelled ifFalse: [self selectedItems]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>promptForCancel [
	"Ask if it is OK to cancel changes"
	
	^(self confirm:
'Changes have not been saved.
Is it OK to cancel changes?' translated)
			
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>requestView: anAnnouncement [
	^ self announcer announce: anAnnouncement 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>rootItems [

	^ rootItems ifNil: [ rootItems := {} ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>rootItems: aCollection [
	rootItems := aCollection.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>rootNodeClassFromItem: anItem [
	^ MorphTreeNodeModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>rootNodeFromItem: anItem [
	^ (self rootNodeClassFromItem: anItem) with: anItem model: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>rootNodes [
	^ (self rootItems ifNil: [^nil])
		collect: [:ci | self rootNodeFromItem: ci].

]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectAll [
	self requestView: MorphTreeChangeRequest selectAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectAllNodePaths: aCollectionOfNodePath [
	self selection: (MorphTreeMorphMultipleSelection new selectedNodePathList: aCollectionOfNodePath)
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectItems: aListOfItems [
	self selection: nil.
	self requestView: ( MorphTreeChangeRequest selectItems: aListOfItems )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectNodePath: aNodePath [
	self selection: (MorphTreeMorphSingleSelection new selectedNodePath: aNodePath)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectedItem [
	^ self selectedNode ifNotNil: [:node | node item]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectedItems [
	^ selection 
		ifNil: [OrderedCollection new]
		ifNotNil: [selection selectedItems]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectedNode [
	^ self selectedNodePath ifNotNil: [:path | path ifEmpty: [nil] ifNotEmpty: [path last]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectedNodePath [
	^ self selection ifNotNil: [:s | s lastSelectedNodePath]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selection [
	^ selection.

]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selection: aSelection [
	self setSelection: aSelection.
	self  requestView: MorphTreeChangeRequest updateSelectionFromModel

]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>selectionChanged [
	self requestView: (MorphTreeSelectionChanged new selection: self selection)

]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>setSelection: aSelection [
	selection := aSelection.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>treeMorphClass [
	^ MorphTreeMorph 
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>updateList [
	| items |
	items := self selectedItems.
	self requestView: MorphTreeChangeRequest updateList.
	self selectItems: items
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>wrapBlockOrSelector [

	^ wrapBlockOrSelector ifNil: [wrapBlockOrSelector := #printString]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>wrapBlockOrSelector: aBlockOrSelector [

	wrapBlockOrSelector := aBlockOrSelector
]

{
	#category : #wrapping,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeModel>>wrapItem: anItem  [
	"Here I return the display of my item, wrapped or not,
	using a block or a selector which will be performed
	directly on the item" 
	^ self wrapBlockOrSelector isBlock
		ifTrue: [wrapBlockOrSelector cull: anItem]
		ifFalse: [wrapBlockOrSelector isSymbol
				ifTrue: [| numArgs |
					numArgs := wrapBlockOrSelector numArgs.
					numArgs isZero
						ifTrue: [anItem perform: wrapBlockOrSelector]
						ifFalse: [numArgs = 1
								ifTrue: [anItem perform: wrapBlockOrSelector with: anItem]
								ifFalse: [self error: 'Wrong number of arguments']]]
				ifFalse: [anItem]]
]
