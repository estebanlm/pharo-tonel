"
I am a data source to diplay tree in a FastTable.

Description
-------------------------------------------------

I receive  a collection of objects and a block. 
The collection of objects will be the base of the tree.

An  alternative is to pass a FTRootItem to myself.

The block is use to calculate the children of the nodes. (More detail at the bottom)
Since the search in Tree is can be complex you can customize it via the #searchStrateagy:. (See Public APIʦor more info.) 

I use FTTreeItem to manage my elements and I am use by a FTFastTable.

Public API and Key Messages
-------------------------------------------------

- #roots: aCollection children: aBlock 
        A constructor to build the FTTreeDataSource  
	
- #maxDepth 
        Set the maxDepth to diplay on the Tree.  Roots items are at depth 0.

- #searchStrategy: 
         Can take in parameter #default, #rootsOnly, #allItems.
                #default is selected by default, it will search/filter the tree for all visible rows.       
               #rootsOnly will search/filter only the first level of the tree
               #allItems will search/filter all the Tree and open the needed items. BEʃAREFUL ! YOUʓHOULDʎOTʕSEʔHISʉFʊYOURʔREEʃANʈAVEʁNʉNFINITYʏFʃHILDREN! 

Example
-------------------------------------------------

	| ds |
	
	ds := FTTreeDataSource roots: (ProtoObject allSubclasses sort: [ :a :b | a asString < b asString ]) children: [ :item | item subclasses sort: [ :a :b | a asString < b asString ] ].
	
	ds maxDepth: 4;
	searchStrategy: #allItems.
	
	FTTableMorph new
		extent: 200 @ 400;
		dataSource: ds;
		explicitFunction;
		openInWindow
	
	
Internal Representation and Key Implementation Points.
-------------------------------------------------

    Instance Variables
	childrenBlock:		I am a block use to generate the children of the Items. I can have 3 arguments: the current Item,   the collection of roots items and the depth of the item.
	items:		I am a collection of FTTreeItem that old the items of the first level of the tree.
	maxDepth:		I am an Integer that represent the max depth to dispaly.  If I am nil I display everything
	searchStrategy: 	 	I am a symbole to know what kind of search/filter strategy I need to apply.
			
    Class Variables
	SearchStrategies 		I am a Dictionary that map a Symbole (see searchStrategy) with a class that can search through a dataSource.  

"
Class {
	#name : #FTTreeDataSource,
	#superclass : #FTDataSource,
	#instVars : [
		'childrenBlock',
		'rootItem',
		'maxDepth',
		'searchStrategy'
	],
	#classVars : [
		'SearchStrategies'
	],
	#category : #Morphic-Widgets-FastTable-Tree,
	#timestamp : 'CyrilFerlicot 11/2/2015 14:33'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource class>>defaultSearchStrategies [
	^ Dictionary new
		at: #rootsOnly put: FTRootItemsStrategy;
		at: #default put: FTVisibleItemsStrategy;
		at: #allItems put: FTAllItemsStrategy;
		yourself
]

{
	#category : #'utils - morph creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource class>>emptyMorph [
	| icon |
	icon := (Smalltalk ui icons iconNamed: #emptyIcon) asMorph.
	icon form: (icon form scaledToSize: 16 @ 16).
	^ icon
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource class>>initialize [
	"self initialize"

	SearchStrategies := nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource class>>root: aRootItem children: aBlock [
	^ self new
		rootItem: aRootItem;
		childrenBlock: aBlock;
		addSourceToRootItem;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource class>>rootItemFor: aCollection [
	^ FTRootItem new
		data: aCollection;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource class>>roots: aCollection children: aBlock [
	^ self root: (self rootItemFor: aCollection) children: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource class>>searchStrategies [
	^ SearchStrategies ifNil: [ SearchStrategies := self defaultSearchStrategies ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource class>>searchStrategies: anObject [
	SearchStrategies := anObject
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>addSourceToRootItem [
	rootItem dataSource: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>buttonFor: item [
	^ ( (self canDisplayChildrenOf: item) and: [item children isNotEmpty])
		ifTrue: [ item generateButton ]
		ifFalse: [ self class emptyMorph ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>canDisplayChildrenOf: item [
	^ self maxDepth ifNil: [ true ] ifNotNil: [ self maxDepth > item depth ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>cellColumn: column row: rowIndex [
	| item cell |
	item := self elementAt: rowIndex.
	cell := FTIndentedCellMorph new.
	cell indentBy: item depth * 16.
	
	cell addMorphBack: (self buttonFor: item).
	cell addMorphBack: (self toString: item data) asMorph.
	^ cell
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>childrenBlock [
	^ childrenBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>childrenBlock: aBlockClosure [
	childrenBlock := aBlockClosure
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>collapseAll [
	rootItem collapseAll.
	self tableRefresh
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>elementAt: index [
	^ rootItem childAt: index
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>expandAll [
	rootItem expandAll.
	self tableRefresh
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>expandAllTo: aDepth [
	self rootItem expandAllTo: aDepth
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>expandRoots [
	self rootsItems do: #expand.
	self tableRefresh
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>indexOfChangedItem [
	"I should be call when the user of the Fast Tree collapse or extand an Item. I return the index of the changed item. I should not be used by an other method than #updateSelectionWithCollectBlock:."

	1 to: self numberOfRows do: [ :index | 
		(self elementAt: index) recentlyChanged
			ifTrue: [ ^ index ] ].
		
	^ self errorSubscriptBounds: self numberOfRows + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>maxDepth [
	^ maxDepth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>maxDepth: anObject [
	maxDepth := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>menuColumn: column row: rowIndex [
	rowIndex = 0
		ifTrue: [ ^ nil ].	"I could answer a menu without selection, but in this case I will just answer nil, which means 'no menu'"
			
	^ (UIManager default newMenuIn: self table for: self)
		add: 'Expand All ' target: self selector: #expandAll;
		add: 'Collapse All' target: self selector: #collapseAll;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>newDataSourceMatching: aFTFilter [
	"I delegate the filter to a FTTreeFunctionStrategy."

	^ (self class searchStrategies at: self searchStrategy ifAbsent: [ self class searchStrategies at: #default ]) filterWith: aFTFilter pattern dataSource: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>numberOfRows [
	^ self rootItem numberOfVisibleChildren 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>realElementAt: anIndex [
	^ (super realElementAt: anIndex) data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>rootItem [
	^ rootItem 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>rootItem: anObject [
	rootItem := anObject
]

{
	#category : #accessing,
	#timestamp : 'EstebanLorenzano 9/6/2017 15:23'
}
FTTreeDataSource>>rootsItems [
	^ rootItem 
		ifNotNil: #children
		ifNil: [ #() ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>searchStrategy [
	^ searchStrategy ifNil: [ #default ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>searchStrategy: anObject [
	"Can be #default, #rootsOnly or #allItems. Use #allItems ONLY if the tree have not an infinit number of children, else you will get an infinit loop."

	searchStrategy := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>searchText: aString [
	"I delegate the search to a FTTreeFunctionStrategy."

	^ (self class searchStrategies at: self searchStrategy ifAbsent: [ self class searchStrategies at: #default ]) searchWith: aString dataSource: self
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>updateData [
	"I am here to reset the items in case someone updated them."

	self rootItem updateData.
	self tableRefresh
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTTreeDataSource>>updateSelectionWithCollectBlock: aBlock [
	"I take a block with two parameters, the index of a selected element and 
	the index of the item that collapsed/expanded. This block needs to return 
	the index of the new selected element. I do not ensure that any of the
	newly selected elements are visible. Use #ensureVisibleFirstSelection for that."

	| index |
	self table selectedRowIndexes ifEmpty: [ ^ self ].
	
	index := self indexOfChangedItem.
	self table 
		selectRowIndexes: ((self table selectedRowIndexes collect: [ :ind | 
			aBlock value: ind value: index ]) asSet) asArray 
		andMakeVisibleIf: false
]
