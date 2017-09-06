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
	#category : #Spec-Core-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel class>>adapterName [

]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel class>>defaultSpec [
	<spec: #default>
	
	^ #(TreeAdapter
		adapt: #(model))
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel class>>example [
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

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel class>>exampleOfAutoRefreshOnExpand [
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

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel class>>exampleWithCustomColumnsAndNodes [
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

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel class>>exampleWithCustomColumnsAndNodesAndChildren [
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

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel class>>exampleWithNoSpecifiedNodes [
	"self exampleWithNoSpecifiedNodes"

	TreeModel new
		 roots: (1 to: 5);
		 childrenBlock: [ :item | 1+item to: 5+item ];
		 openWithSpec
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>allowMenuOnNoItem [

	^ allowMenuOnNoItem value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>allowMenuOnNoItem: aBoolean [

	allowMenuOnNoItem value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>autoDeselection [

	^ autoDeselection value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>autoDeselection: aBoolean [

	autoDeselection value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>autoMultiSelection [

	^ autoMultiSelection value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>autoMultiSelection: aBoolean [

	autoMultiSelection value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>autoRefreshOnExpand [
	^ autoRefreshOnExpand value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>autoRefreshOnExpand: aBoolean [
	autoRefreshOnExpand value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>beCheckList [

	self isCheckList: true
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>childrenBlock [
	"< api: #inspect>"
	"Return the block used to retrieve the children of a node.
	The optional block arguments are:
		- the node
		- the tree"

	^ childrenBlockHolder value
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>childrenBlock: aBlock [
	"< api: #block getter: #childrenBlock registration: #whenChildrenBlockChanged:>"
	"Set the block used to retrieve the children of a node.
	The optional block arguments are:
		- the node
		- the tree"

	childrenBlockHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>childrenFor: anItem [

	^ self childrenBlock cull: anItem cull: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>collapseAll [
	
	self changed: #collapseAll with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>columnInset [

	^ columnInset value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>columnInset: anInteger [

	columnInset value: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>columns [
	
	^ columns value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>columns: aCollection [
	
	columns value: aCollection
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>defaultNodeFor: item [

	^ TreeNodeModel new
		content: item;
		children: [ self childrenFor: item ];
		hasChildren: [ self hasChildrenFor: item ];
		yourself
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>deselectAll [
	
	self changed: #deselectAll with: #()
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>displayBlock [
	"< api: #inspect>"
	"Return the block used to generate the display of the items.
	The optioanl block arguments are:
		- the item
		- the tree"

	^ displayBlock value
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>displayBlock: aBlock [
	"<api: #block getter: #displayBlock registration: #whenDisplayBlockChanged:>"
	"Set the block used to generate the display of the items.
	The optioanl block arguments are:
		- the item
		- the tree"

	displayBlock value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>doubleClick [

	doubleClick value value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>doubleClick: aBlock [

	doubleClick value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>evenRowColor [

	^ evenRowColor value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>evenRowColor: aColor [

	evenRowColor value: aColor
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>eventKeyStrokesForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"	
		
	^ { Character tab asKeyCombination }
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>eventKeyStrokesForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	
	^ { Character tab shift asKeyCombination }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>expandAll [

	self changed: #expandAll with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>expandRoots [

	self changed: #expandRoots with: #()
]

{
	#category : #api-filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>filterWith: aFilter [
	
	self selection: nil.
	self updateTree.

	self expandAll.
	self changed: #filterWith: with: {aFilter}.
	
	self expandAll.
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>hasChildrenBlock [
	"<api: #inspect>"
	"Get the block used to check if a node has children.
	The optional block arguments are:
		- the node
		- the tree"

	^ hasChildrenBlockHolder value
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>hasChildrenBlock: aBlock [
	"< api: #block getter: #hasChildrenBlock registration: #whenHasChildrenBlockChanged:>"
	"Set the block used to  check if a node has children.
	The optional block arguments are:
		- the node
		- the tree"

	hasChildrenBlockHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>hasChildrenFor: anItem [

	^ self hasChildrenBlock cull: anItem cull: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>hasSelectedItem [
	"< api: #inspect>"
	"Return true if the tree contains any selected items"
	
	^ selectionHolder value isNotEmpty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>highlightedItem [
	"<api: #inspect>"
	"Return the currently highlighted item"

	^ highlightedItem value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>highlightedItem: anItem [
	"< api: #st getter: #highlightedItem registration: #whenHighlightedItemChanged:>"
	"Set the highlightedItem item"
	"In the case of keyboard navigation with checklist, it may differ from the last selected item"
	
	highlightedItem value: anItem
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>iconBlock: aBlock [

	iconBlock value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>iconFor: aNode [

	^ iconBlock value cull: aNode content cull: aNode
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>initialize [
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

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>isCheckList [

	^ isCheckList value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>isCheckList: aBoolean [

	isCheckList value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>keyStroke: aKeyStroke [

	keyStroke value cull: aKeyStroke
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>keyStrokeAction: aBlock [

	keyStroke value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>menu [
	"<api: #inspect>"
	"Return the block used to generate the tree menu"

	^ menuBlockHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>menu: aBlock [
"	< api: #block getter: #menu registration: #whenMenuChanged:>"
	"Set the block used to generate the tree menu"

	menuBlockHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>menu: aMenu shifted: aBoolean [
	| menu |
	
	(self allowMenuOnNoItem not and: [ self selectedItems isEmpty ])
		ifTrue: [ ^ nil ].
		
	
	menuBlockHolder value ifNil: [ ^ nil ].
	menuBlockHolder value isBlock ifFalse: [ ^ menuBlockHolder value ].
	
	menu := MenuModel new.
	
	menuBlockHolder value cull: menu cull: aBoolean.
	
	^ menu
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>multiSelection [

	^ multiSelection value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>multiSelection: aBoolean [

	multiSelection value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>oddRowColor [

	^ oddRowColor value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>oddRowColor: aColor [

	oddRowColor value: aColor
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>onWidgetBuilt [
	^ self selectedItems: selectionHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>preferedPaneColor [

	^ preferedPaneColor value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>preferedPaneColor: aColor [

	preferedPaneColor value: aColor
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>registerEvents [
	
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

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>removeOnlyLastSelected: aBoolean [

	removeOnlyLastSelected value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>resetSelection [

	self selectedItems: {}
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>resizerWidth [

	^ resizerWidth value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>resizerWidth: anInteger [

	resizerWidth value: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>rootNodeFor: item [
	| node |
	
	node := self rootNodeHolder cull: item.
	node container: self.
	
	^ node
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>rootNodeHolder [

	^ rootNodeHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>rootNodeHolder: aBlock [

	rootNodeHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>roots [
	"< api: #inspect>"
	"Return the tree roots"

	^ rootsHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>roots: aCollection [
	"< api: #st getter: #roots registration: #whenRootsChanged:>"
	"Set the tree roots"

	rootsHolder value: aCollection.
	self changed: #setRoots: with: { aCollection }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>rowInset [

	^ rowInset value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>rowInset: anInteger [

	rowInset value: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>secondSelection: anItem [
	
	self widget ifNotNil: [ :w | w listManager secondSelection: anItem ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selectAll [
	
	self changed: #selectAdd with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selectOnlyLastHighlighted [

	^ removeOnlyLastSelected value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selectedItem [
	"< api: #inspect>"
	"Return the selected item"
	"In the case of a multiple selection list, it returns the last selected item"
	
	^ selectionHolder value
		ifEmpty: [ nil ]
		ifNotEmpty: [ :col | col  last ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selectedItem: anItem [
	"< api: #st getter: #selectedItem registration: #whenSelectedItemsChanged:>"
	"Set the selected item"
	"In the case of a multiple selection list, it returns the last selected item"
	
	self selectedItems: { anItem }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selectedItems [
	"< api: #inspect>"
	"Return the selected items"
	
	^ selectionHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selectedItems: aCollection [
	"<api: #st getter: #selectedItems registration: #whenSelectedItemsChanged:>"
	"Set the selected item"
	"In the case of a multiple selection list, it returns the last selected item"

	"treeModel selectNodePath: aCollection."
	selectionHolder value: aCollection.
	
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selection: aSelection [
 
	self changed: #selection: with: { aSelection }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selectionChanged [
	
	self changed: #selectionChanged with: #()
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>selectionChanged: ann [

	^ selectionHolder value: (ann selection
		ifNil: [ #() ]
		ifNotNil: [:selection | selection selectedNodes ])
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>updateTree [
	"< api: #do>"
	"Force the tree to refresh"

	self changed: #updateTree with: {}.
	treeUpdated value: nil.
]

{
	#category : #api-events-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenChildrenBlockChanged: aBlock [
	"Set a block to perform when a new childrenBlock is set"

	childrenBlockHolder whenChangedDo: aBlock
]

{
	#category : #api-events-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenDisplayBlockChanged: aBlock [
	"Set a block to perform when a new displayBlock is set"

	displayBlock whenChangedDo: aBlock
]

{
	#category : #api-events-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenHasChildrenBlockChanged: aBlock [
	"Set a block to perform when a new hasChildrenBlock is set"

	hasChildrenBlockHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenHighlightedItemChanged: aBlock [

	highlightedItem whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenMenuChanged: aBlock [
	"Set a block to perform when a new menuBlock is set"

	menuBlockHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenRootsChanged: aBlock [

	rootsHolder whenChangedDo: aBlock
]

{
	#category : #api-events-compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenSelectedItemChanged: aBlock [
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

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenSelectedItemsChanged: aBlock [
	"Set a block to perform when a new item is selected"

	selectionHolder whenChangedDo: [ :col | aBlock cull: (col collect: [:e | e content ]) ]
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>whenTreeUpdated: aBlock [

	treeUpdated whenChangedDo: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeModel>>wrapItem: anItem [

	^ displayBlock value cull: anItem cull: self
]
