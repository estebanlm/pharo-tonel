"
I am the Spec model of a MorphTreeMorph tree.
"
Class {
	#name : #TreeModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'childrenBlockHolder',
		'menuBlockHolder',
		'rootsHolder',
		'selectionHolder',
		'selectedItem',
		'autoMultiSelection',
		'columnInset',
		'doubleClick',
		'evenRowColor',
		'isCheckList',
		'keyStroke',
		'multiSelection',
		'oddRowColor',
		'preferedPaneColor',
		'resizerWidth',
		'rowInset',
		'displayBlock',
		'columns',
		'treeUpdated',
		'iconBlock',
		'autoDeselection',
		'allowMenuOnNoItem',
		'rootNodeHolder',
		'removeOnlyLastSelected',
		'highlightedItem',
		'hasChildrenBlockHolder',
		'autoRefreshOnExpand'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
TreeModel class >> adapterName [
]

{ #category : #specs }
TreeModel class >> defaultSpec [
	<spec: #default>
	
	^ #(TreeAdapter
		adapt: #(model))
]

{ #category : #examples }
TreeModel class >> example [
	| m |

	m := self new.
	m openWithSpec.
	
	m roots: #(a b c d).
	m childrenBlock: [:it | it = #c 
		ifTrue: [ {1. 2. 3} ]
		ifFalse: [ {} ]].
	m displayBlock: [:item | item isSymbol
		ifTrue: [ item asUppercase , ' symbol' ]
		ifFalse: [ item printString ]].
	m 
		dragEnabled: true;
		dropEnabled: true;
		wantDropBlock: [ :draggedItem :event :source | 
			draggedItem isTransferable and: [ draggedItem source = m ] ];
		acceptDropBlock: [ :transfer :event :source :receiver | 
			Transcript 
				show: 'Dragged node '; 
				show: transfer passenger content; 
				show: ' to node '; 
				show: receiver content; 
				cr ].
		
	^ m
]

{ #category : #examples }
TreeModel class >> exampleOfAutoRefreshOnExpand [
	"Each time a node is expanded, the computation of the children is made again, instead of being cached as it is usually"

	TreeModel new
		childrenBlock: [ :number | 
			self logCr: 'Compute children of ', number asString.
			1 to: number ];
		hasChildrenBlock: [ :number | true ];
		roots: (1 to: 10);
		autoRefreshOnExpand: true;
		openWithSpec
]

{ #category : #examples }
TreeModel class >> exampleWithCustomColumnsAndNodes [
	"self exampleWithCustomColumnsAndNodes"
	| m col1 col2 |

	m := TreeModel new.
	m roots: #(#a #b #c #d).
	m rootNodeHolder: [ :item | 
		TreeNodeModel new
			content: item;
			icon: (self iconNamed: #smallConfigurationIcon)
	].
	
	m openWithSpec.
	
	col1 := TreeColumnModel new
		displayBlock: [ :node | node content asString ];
		headerLabel: 'Character'.
	col2 := TreeColumnModel new
		displayBlock: [ :node | (Character value: node content asString first asciiValue + 1) asString ];
		headerLabel: 'Character +1';
		headerIcon: (self iconNamed: #smallBackIcon).
	
	m
		columns: {col1. col2};
		dragEnabled: true;
		dropEnabled: true;
		acceptDropBlock: [ :transfer :event :source :receiver | self halt ].
		
	col2 
		headerLabel: 'Character +2';
		headerIcon: (self iconNamed: #smallBackIcon);
		displayBlock: [ :node | (Character value: node content asString first asciiValue + 2) asString ].
	
	m rootNodeHolder: [ :item | 
		TreeNodeModel new
			content: (Character value: (item asString first asciiValue + 5)) asSymbol;
			icon: (self iconNamed: #smallFullscreenIcon)
	].

	col1 headerIcon: (self iconNamed: #nautilusIcon).
]

{ #category : #examples }
TreeModel class >> exampleWithCustomColumnsAndNodesAndChildren [
	"self exampleWithCustomColumnsAndNodesAndChildren"

	| m col1 col2 |
	m := TreeModel new.
	m roots: #(#a #b #c #d).
	m
		rootNodeHolder: [ :item | 
			TreeNodeModel new
				content: item;
				children: [ (1 to: item asString first asciiValue) collect: [ :e | TreeNodeModel new content: e ] ];
				icon: (m iconNamed: #smallConfigurationIcon) ].
	m openWithSpec.
	col1 := TreeColumnModel new
		displayBlock: [ :node | node content asString ];
		headerAction: [ self halt ].
	col2 := TreeColumnModel new
		displayBlock: [ :node | (Character value: node content asString first asciiValue + 1) asString ].
	m
		columns:
			{col1.
			col2};
		dragEnabled: true;
		dropEnabled: true;
		acceptDropBlock: [ :transfer :event :source :receiver | self halt ].
	col2
		displayBlock: [ :node | (Character value: node content asString first asciiValue + 2) asString ]
]

{ #category : #examples }
TreeModel class >> exampleWithNoSpecifiedNodes [
	"self exampleWithNoSpecifiedNodes"

	TreeModel new
		 roots: (1 to: 5);
		 childrenBlock: [ :item | 1+item to: 5+item ];
		 openWithSpec
]

{ #category : #api }
TreeModel >> allowMenuOnNoItem [

	^ allowMenuOnNoItem value
]

{ #category : #api }
TreeModel >> allowMenuOnNoItem: aBoolean [

	allowMenuOnNoItem value: aBoolean
]

{ #category : #api }
TreeModel >> autoDeselection [

	^ autoDeselection value
]

{ #category : #api }
TreeModel >> autoDeselection: aBoolean [

	autoDeselection value: aBoolean
]

{ #category : #api }
TreeModel >> autoMultiSelection [

	^ autoMultiSelection value
]

{ #category : #api }
TreeModel >> autoMultiSelection: aBoolean [

	autoMultiSelection value: aBoolean
]

{ #category : #api }
TreeModel >> autoRefreshOnExpand [
	^ autoRefreshOnExpand value
]

{ #category : #api }
TreeModel >> autoRefreshOnExpand: aBoolean [
	autoRefreshOnExpand value: aBoolean
]

{ #category : #api }
TreeModel >> beCheckList [

	self isCheckList: true
]

{ #category : #api-compatibility }
TreeModel >> childrenBlock [
	"< api: #inspect>"
	"Return the block used to retrieve the children of a node.
	The optional block arguments are:
		- the node
		- the tree"

	^ childrenBlockHolder value
]

{ #category : #api-compatibility }
TreeModel >> childrenBlock: aBlock [
	"< api: #block getter: #childrenBlock registration: #whenChildrenBlockChanged:>"
	"Set the block used to retrieve the children of a node.
	The optional block arguments are:
		- the node
		- the tree"

	childrenBlockHolder value: aBlock
]

{ #category : #api }
TreeModel >> childrenFor: anItem [

	^ self childrenBlock cull: anItem cull: self
]

{ #category : #api }
TreeModel >> collapseAll [
	
	self changed: #collapseAll with: #()
]

{ #category : #api }
TreeModel >> columnInset [

	^ columnInset value
]

{ #category : #api }
TreeModel >> columnInset: anInteger [

	columnInset value: anInteger
]

{ #category : #api }
TreeModel >> columns [
	
	^ columns value
]

{ #category : #api }
TreeModel >> columns: aCollection [
	
	columns value: aCollection
]

{ #category : #initialization }
TreeModel >> defaultNodeFor: item [

	^ TreeNodeModel new
		content: item;
		children: [ self childrenFor: item ];
		hasChildren: [ self hasChildrenFor: item ];
		yourself
]

{ #category : #api }
TreeModel >> deselectAll [
	
	self changed: #deselectAll with: #()
]

{ #category : #api-compatibility }
TreeModel >> displayBlock [
	"< api: #inspect>"
	"Return the block used to generate the display of the items.
	The optioanl block arguments are:
		- the item
		- the tree"

	^ displayBlock value
]

{ #category : #api-compatibility }
TreeModel >> displayBlock: aBlock [
	"<api: #block getter: #displayBlock registration: #whenDisplayBlockChanged:>"
	"Set the block used to generate the display of the items.
	The optioanl block arguments are:
		- the item
		- the tree"

	displayBlock value: aBlock
]

{ #category : #api }
TreeModel >> doubleClick [

	doubleClick value value
]

{ #category : #api }
TreeModel >> doubleClick: aBlock [

	doubleClick value: aBlock
]

{ #category : #api }
TreeModel >> evenRowColor [

	^ evenRowColor value
]

{ #category : #api }
TreeModel >> evenRowColor: aColor [

	evenRowColor value: aColor
]

{ #category : #focus }
TreeModel >> eventKeyStrokesForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"	
		
	^ { Character tab asKeyCombination }
]

{ #category : #focus }
TreeModel >> eventKeyStrokesForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	
	^ { Character tab shift asKeyCombination }
]

{ #category : #api }
TreeModel >> expandAll [

	self changed: #expandAll with: #()
]

{ #category : #api }
TreeModel >> expandRoots [

	self changed: #expandRoots with: #()
]

{ #category : #api-filtering }
TreeModel >> filterWith: aFilter [
	
	self selection: nil.
	self updateTree.

	self expandAll.
	self changed: #filterWith: with: {aFilter}.
	
	self expandAll.
]

{ #category : #api-compatibility }
TreeModel >> hasChildrenBlock [
	"<api: #inspect>"
	"Get the block used to check if a node has children.
	The optional block arguments are:
		- the node
		- the tree"

	^ hasChildrenBlockHolder value
]

{ #category : #api-compatibility }
TreeModel >> hasChildrenBlock: aBlock [
	"< api: #block getter: #hasChildrenBlock registration: #whenHasChildrenBlockChanged:>"
	"Set the block used to  check if a node has children.
	The optional block arguments are:
		- the node
		- the tree"

	hasChildrenBlockHolder value: aBlock
]

{ #category : #api }
TreeModel >> hasChildrenFor: anItem [

	^ self hasChildrenBlock cull: anItem cull: self
]

{ #category : #api }
TreeModel >> hasSelectedItem [
	"< api: #inspect>"
	"Return true if the tree contains any selected items"
	
	^ selectionHolder value isNotEmpty
]

{ #category : #api }
TreeModel >> highlightedItem [
	"<api: #inspect>"
	"Return the currently highlighted item"

	^ highlightedItem value
]

{ #category : #api }
TreeModel >> highlightedItem: anItem [
	"< api: #st getter: #highlightedItem registration: #whenHighlightedItemChanged:>"
	"Set the highlightedItem item"
	"In the case of keyboard navigation with checklist, it may differ from the last selected item"
	
	highlightedItem value: anItem
]

{ #category : #api }
TreeModel >> iconBlock: aBlock [

	iconBlock value: aBlock
]

{ #category : #api }
TreeModel >> iconFor: aNode [

	^ iconBlock value cull: aNode content cull: aNode
]

{ #category : #initialization }
TreeModel >> initialize [
	super initialize.

	childrenBlockHolder := [ {} ] asValueHolder.
	hasChildrenBlockHolder := [ :item | (self childrenFor: item) notEmpty ] asValueHolder.
	rootsHolder := {} asValueHolder.
	selectionHolder := {} asValueHolder.
	menuBlockHolder := [] asValueHolder.
	displayBlock := [:item | item asString ] asValueHolder.
	
	removeOnlyLastSelected := false asValueHolder.
	autoDeselection := true asValueHolder.
	autoMultiSelection := false asValueHolder.
	columnInset := 5 asValueHolder.
	doubleClick := [] asValueHolder.
	allowMenuOnNoItem := false asValueHolder.
	isCheckList := false asValueHolder.
	keyStroke := [ :key | ] asValueHolder.
	multiSelection := false asValueHolder.
	evenRowColor := Smalltalk ui theme backgroundColor asValueHolder.
	oddRowColor := Smalltalk ui theme backgroundColor asValueHolder.
	preferedPaneColor := Smalltalk ui theme backgroundColor asValueHolder.
	resizerWidth := 2 asValueHolder.
	rowInset := 2 asValueHolder.
	iconBlock := [ :each : node | node icon ] asValueHolder.
	highlightedItem := nil asValueHolder.
	rootNodeHolder := [ :item |
		TreeNodeModel new 
			content: item;
			children: [ self childrenFor: item ] ] asValueHolder.
	
	columns := { TreeColumnModel new
		displayBlock: [:node | (self wrapItem: node content) ] } asValueHolder.
	
	autoRefreshOnExpand := false asValueHolder.
	
	"Since my nodes are already morphs, dragging them will actually extract them from their owner"
	dragTransformationBlock := [ :item :source | item complexContents ] asValueHolder.

	treeUpdated := nil asValueHolder.

	self registerEvents
]

{ #category : #api }
TreeModel >> isCheckList [

	^ isCheckList value
]

{ #category : #api }
TreeModel >> isCheckList: aBoolean [

	isCheckList value: aBoolean
]

{ #category : #api }
TreeModel >> keyStroke: aKeyStroke [

	keyStroke value cull: aKeyStroke
]

{ #category : #api }
TreeModel >> keyStrokeAction: aBlock [

	keyStroke value: aBlock
]

{ #category : #api }
TreeModel >> menu [
	"<api: #inspect>"
	"Return the block used to generate the tree menu"

	^ menuBlockHolder value
]

{ #category : #api }
TreeModel >> menu: aBlock [
"	< api: #block getter: #menu registration: #whenMenuChanged:>"
	"Set the block used to generate the tree menu"

	menuBlockHolder value: aBlock
]

{ #category : #api }
TreeModel >> menu: aMenu shifted: aBoolean [
	| menu |
	
	(self allowMenuOnNoItem not and: [ self selectedItems isEmpty ])
		ifTrue: [ ^ nil ].
		
	
	menuBlockHolder value ifNil: [ ^ nil ].
	menuBlockHolder value isBlock ifFalse: [ ^ menuBlockHolder value ].
	
	menu := MenuModel new.
	
	menuBlockHolder value cull: menu cull: aBoolean.
	
	^ menu
]

{ #category : #api }
TreeModel >> multiSelection [

	^ multiSelection value
]

{ #category : #api }
TreeModel >> multiSelection: aBoolean [

	multiSelection value: aBoolean
]

{ #category : #api }
TreeModel >> oddRowColor [

	^ oddRowColor value
]

{ #category : #api }
TreeModel >> oddRowColor: aColor [

	oddRowColor value: aColor
]

{ #category : #initialization }
TreeModel >> onWidgetBuilt [
	^ self selectedItems: selectionHolder value
]

{ #category : #api }
TreeModel >> preferedPaneColor [

	^ preferedPaneColor value
]

{ #category : #api }
TreeModel >> preferedPaneColor: aColor [

	preferedPaneColor value: aColor
]

{ #category : #initialization }
TreeModel >> registerEvents [
	
	rootsHolder whenChangedDo: [ self updateTree ].
	childrenBlockHolder whenChangedDo: [ self updateTree ].
	hasChildrenBlockHolder whenChangedDo: [ self updateTree ].
	displayBlock whenChangedDo: [ self updateTree ].
	
	iconBlock whenChangedDo: [ self updateTree ].
	autoDeselection whenChangedDo: [ :boolean | self update: {#autoDeselection:. boolean} ].
	columns whenChangedDo: [ :col | 
		col do: [ :each | each container: self ].
		self changed: #columns: with: { col } ].
	selectionHolder whenChangedDo: [:items | self changed: { #selectItems. items } ].
	rootNodeHolder whenChangedDo: [ :aBlock | self updateTree ].
	isCheckList whenChangedDo: [ :boolean | self changed: #isCheckList: with: { boolean }].
	oddRowColor whenChangedDo: [ :aColor | self changed: #oddRowColor: with: { aColor } ].
	evenRowColor whenChangedDo: [ :aColor | self changed: #evenRowColor: with: { aColor } ].
	
	menuBlockHolder  whenChangedDo: [ :aMenuModel :oldMenuModel |
		oldMenuModel ifNotNil: [ | oldMenu |
			oldMenuModel isBlock
				ifTrue: [ 
					oldMenu := MenuModel new.
					oldMenuModel cull: oldMenu cull: false ]
				ifFalse: [ oldMenu := oldMenuModel ].
		oldMenu applyTo: self ].
		
		aMenuModel ifNotNil: [ | newMenu |
			aMenuModel isBlock
				ifTrue: [ 
					newMenu := MenuModel new.
					aMenuModel cull: newMenu cull: false ]
				ifFalse: [ newMenu := aMenuModel ].
		newMenu applyTo: self ] ].

	self announcer 
		when: WidgetBuilt
		send: #onWidgetBuilt
		to: self.
]

{ #category : #api }
TreeModel >> removeOnlyLastSelected: aBoolean [

	removeOnlyLastSelected value: aBoolean
]

{ #category : #api }
TreeModel >> resetSelection [

	self selectedItems: {}
]

{ #category : #api }
TreeModel >> resizerWidth [

	^ resizerWidth value
]

{ #category : #api }
TreeModel >> resizerWidth: anInteger [

	resizerWidth value: anInteger
]

{ #category : #api }
TreeModel >> rootNodeFor: item [
	| node |
	
	node := self rootNodeHolder cull: item.
	node container: self.
	
	^ node
]

{ #category : #api }
TreeModel >> rootNodeHolder [

	^ rootNodeHolder value
]

{ #category : #api }
TreeModel >> rootNodeHolder: aBlock [

	rootNodeHolder value: aBlock
]

{ #category : #api }
TreeModel >> roots [
	"< api: #inspect>"
	"Return the tree roots"

	^ rootsHolder value
]

{ #category : #api }
TreeModel >> roots: aCollection [
	"< api: #st getter: #roots registration: #whenRootsChanged:>"
	"Set the tree roots"

	rootsHolder value: aCollection.
	self changed: #setRoots: with: { aCollection }
]

{ #category : #api }
TreeModel >> rowInset [

	^ rowInset value
]

{ #category : #api }
TreeModel >> rowInset: anInteger [

	rowInset value: anInteger
]

{ #category : #api }
TreeModel >> secondSelection: anItem [
	
	self widget ifNotNil: [ :w | w listManager secondSelection: anItem ]
]

{ #category : #api }
TreeModel >> selectAll [
	
	self changed: #selectAdd with: #()
]

{ #category : #api }
TreeModel >> selectOnlyLastHighlighted [

	^ removeOnlyLastSelected value
]

{ #category : #api }
TreeModel >> selectedItem [
	"< api: #inspect>"
	"Return the selected item"
	"In the case of a multiple selection list, it returns the last selected item"
	
	^ selectionHolder value
		ifEmpty: [ nil ]
		ifNotEmpty: [ :col | col  last ]
]

{ #category : #api }
TreeModel >> selectedItem: anItem [
	"< api: #st getter: #selectedItem registration: #whenSelectedItemsChanged:>"
	"Set the selected item"
	"In the case of a multiple selection list, it returns the last selected item"
	
	self selectedItems: { anItem }
]

{ #category : #api }
TreeModel >> selectedItems [
	"< api: #inspect>"
	"Return the selected items"
	
	^ selectionHolder value
]

{ #category : #api }
TreeModel >> selectedItems: aCollection [
	"<api: #st getter: #selectedItems registration: #whenSelectedItemsChanged:>"
	"Set the selected item"
	"In the case of a multiple selection list, it returns the last selected item"

	"treeModel selectNodePath: aCollection."
	selectionHolder value: aCollection.
	
]

{ #category : #api }
TreeModel >> selection: aSelection [
 
	self changed: #selection: with: { aSelection }
]

{ #category : #api }
TreeModel >> selectionChanged [
	
	self changed: #selectionChanged with: #()
]

{ #category : #initialization }
TreeModel >> selectionChanged: ann [

	^ selectionHolder value: (ann selection
		ifNil: [ #() ]
		ifNotNil: [:selection | selection selectedNodes ])
]

{ #category : #api }
TreeModel >> updateTree [
	"< api: #do>"
	"Force the tree to refresh"

	self changed: #updateTree with: {}.
	treeUpdated value: nil.
]

{ #category : #api-events-compatibility }
TreeModel >> whenChildrenBlockChanged: aBlock [
	"Set a block to perform when a new childrenBlock is set"

	childrenBlockHolder whenChangedDo: aBlock
]

{ #category : #api-events-compatibility }
TreeModel >> whenDisplayBlockChanged: aBlock [
	"Set a block to perform when a new displayBlock is set"

	displayBlock whenChangedDo: aBlock
]

{ #category : #api-events-compatibility }
TreeModel >> whenHasChildrenBlockChanged: aBlock [
	"Set a block to perform when a new hasChildrenBlock is set"

	hasChildrenBlockHolder whenChangedDo: aBlock
]

{ #category : #api-events }
TreeModel >> whenHighlightedItemChanged: aBlock [

	highlightedItem whenChangedDo: aBlock
]

{ #category : #api-events }
TreeModel >> whenMenuChanged: aBlock [
	"Set a block to perform when a new menuBlock is set"

	menuBlockHolder whenChangedDo: aBlock
]

{ #category : #api-events }
TreeModel >> whenRootsChanged: aBlock [

	rootsHolder whenChangedDo: aBlock
]

{ #category : #api-events-compatibility }
TreeModel >> whenSelectedItemChanged: aBlock [
	"Set a block to perform when a new item is selected"

	selectionHolder whenChangedDo: [ :col | 
		col 
			ifNil: [ aBlock value: nil ]
			ifNotNil: [ col isEmpty
					ifTrue: [ aBlock value: nil ]
					ifFalse: [ aBlock value: (col last lastClicked
						ifTrue: [ col last content ]
						ifFalse: [ nil ]) ] ] ]
]

{ #category : #api-events }
TreeModel >> whenSelectedItemsChanged: aBlock [
	"Set a block to perform when a new item is selected"

	selectionHolder whenChangedDo: [ :col | aBlock cull: (col collect: [:e | e content ]) ]
]

{ #category : #api-events }
TreeModel >> whenTreeUpdated: aBlock [

	treeUpdated whenChangedDo: aBlock
]

{ #category : #api }
TreeModel >> wrapItem: anItem [

	^ displayBlock value cull: anItem cull: self
]
