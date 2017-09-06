"
I am a tree plus an input field to be able to filter the tree elements
"
Class {
	#name : #SearchableTree,
	#superclass : #ComposableModel,
	#instVars : [
		'inputField',
		'roots',
		'tree',
		'label',
		'button'
	],
	#category : #Spec-PolyWidgets-ListAndTree,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree class>>defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newRow: [:r |
			r
			"add: #label width: 50;"
			add: #inputField;
			add: #button width: 25 ] height: 25;
		newRow: #tree top: 25;
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree class>>example [
	^ self new
		openWithSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree class>>searchAtBottom [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [:c |
			c 
				add: #tree;
				newRow: [:r |
					r
					"add: #label width: 50;"
					add: #inputField;
					add: #button width: 25 ] height: 25 ];
		yourself
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>autoAccept: aBoolean [

	inputField autoAccept: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>autoMultiSelection: aBoolean [

	tree autoMultiSelection: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>button [

	^ button
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>childrenBlock [
	
	^ tree childrenBlock
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>childrenBlock: aBlock [
	
	tree childrenBlock: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>columnInset: anInteger [

	tree columnInset: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>columns [
	
	^ tree columns
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>columns: aCollection [
	
	tree columns: aCollection
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>displayBlock [

	^ tree displayBlock
]

{
	#category : #api-compatibility,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>displayBlock: aBlock [
	
	tree displayBlock: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>doubleClick: aBlock [

	tree doubleClick: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>evenRowColor: aColor [

	tree evenRowColor: aColor
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>highlightedItem: aTreeNodeModel [
	
	tree highlightedItem: aTreeNodeModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>iconBlock: aBlock [
	
	tree iconBlock: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>initialize [

	super initialize.

	roots := OrderedCollection new asValueHolder
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>initializePresenter [

	inputField whenTextChanged: [ :text | self updateRootFor: text ].
		
	tree whenTreeUpdated: [ inputField text: '' ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>initializeWidgets [

	tree := self newTree.
	inputField := self newTextInput.
	label := self newLabel.
	button := self newButton.
			
	tree rootNodeHolder: [ :item | 
		(tree defaultNodeFor: item)
			matchTokenFilterBlock: [ :aFilter |
				aFilter token
					ifEmpty: [ true ]
					ifNotEmpty: [ item asString asLowercase includesSubstring: aFilter token asLowercase ] ];
			yourself ].
			
	button 
		label: '';
		icon: (self iconNamed: #smallFindIcon);
		state: false;
		action: [ inputField accept ].
			
	label 
		label: 'Search:';
		color:Color black.
	
	inputField
		ghostText: 'Search';
		entryCompletion: nil;
		acceptOnCR: true.
		
	self focusOrder
		add: tree;
		add: inputField
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>inputField [
	^ inputField
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>isCheckList: aBoolean [

	tree isCheckList: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>keyStrokeAction: aBlock [

	tree keyStrokeAction: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>label [
	^ label
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>menu [
	
	^ tree menu
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>menu: aBlock [
	
	tree menu: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>multiSelection: aBoolean [

	tree multiSelection: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>preferedPaneColor: aColor [

	tree preferedPaneColor: aColor
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>resetSelection [

	tree resetSelection
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>resizerWidth: anInteger [

	tree resizerWidth: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>rootNodeHolder [

	^ tree rootNodeHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>rootNodeHolder: aBlock [

	tree rootNodeHolder: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>roots [
	
	^ tree roots
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>roots: aCollection [

	roots value: aCollection asOrderedCollection.	
	tree roots: aCollection asOrderedCollection
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>rowInset: anInteger [

	tree rowInset: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>secondSelection: anItem [
	
	tree secondSelection: anItem
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>selectedItem [
	
	^ tree selectedItem
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>selectedItem: anItem [
	
	tree selectedItem: anItem
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>selectedItems [
	
	^ tree selectedItems
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>selectedItems: aCollection [
	
	tree selectedItems: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>tree [
	^ tree
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>updateRootFor: aText [
	| aFilter |
	
	aFilter := TokenTreeFilter token: aText.
	tree filterWith: aFilter
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>updateTree [
	
	tree updateTree
]

{
	#category : #api-events-compatibility,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>whenChildrenBlockChanged: aBlock [
	
	tree whenChildrenBlockChanged: aBlock
]

{
	#category : #api-events-compatibility,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>whenDisplayBlockChanged: aBlock [
	
	tree whenDisplayBlockChanged: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>whenMenuChanged: aBlock [
	
	tree whenMenuChanged: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>whenRootsChanged: aBlock [

	roots whenChangedDo: aBlock
]

{
	#category : #'list api-events',
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>whenSelectedItemChanged: aBlock [

	tree whenSelectedItemChanged: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SearchableTree>>whenSelectedItemsChanged: aBlock [
	
	tree whenSelectedItemsChanged: aBlock
]
