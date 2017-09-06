"
I am the adapter used to bridge a TreeModel and a MorphTreeMorph
"
Class {
	#name : #MorphicTreeAdapter,
	#superclass : #AbstractMorphicAdapter,
	#instVars : [
		'treeModel'
	],
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'drag and drop - private',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>acceptDroppingMorph: draggedMorph event: event inMorph: source [
	| item |
	item := self widget ifNotNil: [ :w | w scrollerSubMorphFromPoint: event position ].
	item ifNil: [ ^ self ].
	^ self acceptDropBlock
		valueWithEnoughArguments: { draggedMorph model model. event. source model model model. item model nodeModel}
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>autoDeselection [

	^ self model autoDeselection
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>autoMultiSelection [

	^ self model autoMultiSelection
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>buildWidget [
	^ MorphTreeMorph new
		model: self treeModel;
		dragEnabled: self dragEnabled;
		dropEnabled: self dropEnabled;
		initializeColumsFrom: self;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		autoDeselection: self autoDeselection;
		resizerWidth: self resizerWidth;
		columnInset: self columnInset;
		iconBlock: self iconBlock;
		rowInset: self rowInset;
		keystrokeActionSelector: #keyStroke:;
		multiSelection: self multiSelection;
		autoMultiSelection: self autoMultiSelection;
		removeOnlyLastSelected: self selectOnlyLastHighlighted;
		isCheckList: self isCheckList;
		doubleClickSelector: #doubleClick;
		getMenuSelector: #menu:shifted:;
		rowColorForEven: self evenRowColor;
		rowColorForOdd: self oddRowColor;
		buildContents;
		yourself
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>changed: aSymbol [

	treeModel changed: aSymbol
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>childrenFor: aNode [

	^ self model childrenFor: aNode
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>collapseAll [

	self treeModel collapseAll
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>columnInset [

	^ self model columnInset
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>columns [

	^ self model columns collect: [ :each | each buildWithSpec ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>columns: newColumns [

	self widgetDo: [ :w || columns |
		columns := newColumns collect: [ :each | each buildWithSpec ]. 
		w columns: columns.
		w resizerChanged.
		w updateList ]
]

{
	#category : #'reflective operations',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>doesNotUnderstand: aMessage [

	(self treeModel respondsTo: aMessage selector) 
		ifFalse: [ ^ super doesNotUnderstand: aMessage ].
		
	^ self treeModel 
		perform: aMessage selector 
		withArguments: aMessage arguments
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>doubleClick [

	^ self model doubleClick
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>evenRowColor [

	^ self model evenRowColor
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>evenRowColor: aColor [

	^ self widget rowColorForEven: aColor
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>expandAll [

	self treeModel expandAll
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>expandRoots [

	self treeModel expandRoots
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>filterWith: aFilter [
	
	self widgetDo: [ :w || nodes |
		nodes := w model rootNodes.
		nodes do: [:r | r nodeModel updateAccordingTo: aFilter].
	
		self removeRootsSuchAs: [:n | (aFilter keepTreeNode: n) not and: [n isEmpty]].

		self changed: #rootNodes ].
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>iconBlock [

	^ [:each | self iconFor: each ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>iconFor: aNode [

	^ self model iconFor: aNode
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>initialize [

	super initialize.

	treeModel := SpecTreeModel model: self.	
	treeModel announcer
		when: MorphTreeSelectionChanged
		send: #onMorphTreeSelectionChanged:
		to: self.
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>isCheckList [

	^ self model isCheckList
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>isCheckList: aBoolean [

	self widgetDo: [ :w | w isCheckList: aBoolean ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>keyStroke: aKeyStroke [

	^ self model keyStroke: aKeyStroke
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>menu: aMenu shifted: aBoolean [

	^ (self model menu: aMenu shifted: aBoolean) 
		ifNotNil: [ :menuModel | menuModel buildWithSpecAsPopup ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>multiSelection [

	^ self model multiSelection
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>oddRowColor [

	^ self model oddRowColor
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>oddRowColor: aColor [

	^ self widget rowColorForOdd: aColor
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>onMorphTreeSelectionChanged: ann [
	| items |
	
	items := (ann selection
		ifNil: [ #() ]
		ifNotNil: [:selection | selection selectedNodes ]).
		
	items := items collect: [ :each | each nodeModel ].

	self model selectedItems: items
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>preferedPaneColor [

	^ self model preferedPaneColor
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>removeRootsSuchAs: aBlock [

	self widgetDo: [ :w | w model rootNodes removeAllSuchThat: [ :node | aBlock value: node nodeModel ] ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>resizerWidth [

	^ self model resizerWidth
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>rootNodeFromItem: item [
	| node |
	
	node := item isTreeNodeModel
		ifTrue: [ item ]
		ifFalse: [ self rootNodeHolder cull: item ].
		
	node container: self model.
	^ node buildWithSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>rootNodeHolder [

	^ self model rootNodeHolder
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>roots [

	^ self model roots
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>rowInset [

	^ self model rowInset
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>selectAdd [

	self widgetDo: [ :w | w selectAll ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>selectOnlyLastHighlighted [

	^ self model selectOnlyLastHighlighted
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>setRoots: aCollection [

	treeModel rootItems: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>treeModel [
	^ treeModel
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>updateTree [

	self treeModel resetRootNodes.
	self treeModel changed: #rootNodes.
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTreeAdapter>>wrapItem: anItem [

	^ self model wrapItem: anItem
]
