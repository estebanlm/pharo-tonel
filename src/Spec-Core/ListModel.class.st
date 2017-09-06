"
A ListComposableModel is an applicative model which handle a basic list.
See AbstractWidgetModel

self example
self example2
self example3

You can also have a look at ExampleListModel >> exampleRegisteredColor and ListSelectionModel for more examples.

I provide the following variables and their accessors
- backgroundColorBlock should convert an item in the color in the background in the line of this item.
- displayBlock should convert an item in something that can be displayed in a list, use asStringOrText by default.
- filteringBlock should convert an item in a boolean representing if the item will be displayed, initialize with self defaultFilteringBlock.
- multiSelection is a boolean representing if several items can be selected in the same time, it have shortcut beMultipleSelection and beSingleSelection.
- sortingBlock should convert two items in a boolean representing if the first item must be place before the second, initialize with self defaultSortingBlock.

Blocks should be set before items.

I provide the following methods
- items: to set the list with the elements of the collection in parameter
- getIndex is the getter of the index of the selected item or the last selected item.
- getList is the getter of the list.
- listSize is the number of items.


todo
- allowToSelect
- autoDeselect
- menu
- listItems
- clickOnSelectedItem
- getSelectionStateFor:
- listElementAt:ifAbsent:
- refresh ...
- select ... , setSelected ...
- updateList

"
Class {
	#name : #ListModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'selectionHolder',
		'listHolder',
		'menuHolder',
		'shortcutsHolder',
		'multiSelectionHolder',
		'multiSelection',
		'allowToSelect',
		'listItemsCache',
		'filteringBlockHolder',
		'sortingBlockHolder',
		'wrapBlockHolder',
		'listAnnouncer',
		'backgroundColorBlock',
		'autoDeselect'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 7/19/2016 11:13'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel class>>adapterName [

	^ #ListAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel class>>defaultSpec [
	<spec: #default>
	
	^ #(ListAdapter
		adapt: #(model))
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel class>>example [
	^ self
		new
		openWithSpec;
		items: Smalltalk allClasses
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel class>>title [

	^ 'List'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>allowToSelect [
	"<api: #inspect>"
	"Return whether the list items can be selected or not"

	^ allowToSelect value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>allowToSelect: aBoolean [
	"<api: #boolean getter: #allowToSelect registration: #whenAllowToSelectChanged:>"
	"Set if the list items can be selected or not"

	allowToSelect value: aBoolean.
	aBoolean 
		ifFalse: [ self resetSelection ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>autoDeselect [
	"<api: #inspect>"
	"Return whether the list items can be selected if it's already the selected item"
	"If true, clicking again on the selected item will unselect it"

	^ autoDeselect value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>autoDeselect: aBoolean [
	"<api: #boolean getter: #autoDeselect registration: #whenAutoSelectChanged:>"
	"Set if the list items can be selected again"

	autoDeselect value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>backgroundColorBlock [
	"<api: #inspect>"
	"Return the block use to compute the background color for each item"

	^ backgroundColorBlock value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>backgroundColorBlock: aBlock [
	"<api: #block getter: #backgroundColorBlock registration: #whenBackgroundColorBlockChanged:>"
	"Set the block used to compute an item background"

	backgroundColorBlock value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>backgroundColorFor: anItem at: index [

	^ self backgroundColorBlock cull: anItem cull: index
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>beMultipleSelection [
	"<api: #do>"
	"Make list selection multiple"

	self multiSelection: true
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>beSingleSelection [
	"<api: #do>"
	"Make list selection single"

	self multiSelection: false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>clickOnSelectedItem [
	| item |
	
	item := self selectedItem.
	(item notNil and: [ item respondsTo: #click ])
		ifTrue: [ ^ item click ]
		ifFalse: [ ^ false ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>defaultFilteringBlock  [
	^ [:col | col]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>defaultSortingBlock  [
	^ [:a :b | true]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>displayBlock [
	"<api: #inspect>"
	"Return the one argument block used to wrap your domain specific items.
	The block should return something that can be displayed in a list - like a String or a Text"
	
	^ wrapBlockHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>displayBlock: aBlock [
	"<api: #block getter:#displayBlock registration: #whenDisplayBlockChanged:>"
	"Set the one argument block used to wrap your domain specific items.
	The block should return something that can be displayed in a list - like a String or a Text"
	
	wrapBlockHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>filteringBlock [
	"<api: #inspect>"
	"Return the filtering of the items"
	
	^ filteringBlockHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>filteringBlock: aBlock [
	"<api: #block getter: #filteringBlock registration: #whenFilteringBlockChanged:>"
	"To set the filtering of the items"
	
	filteringBlockHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>getIndex [
	"Return the index of the selected item"
	
	^  selectionHolder index value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>getList [

	^ listHolder value
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>getSelectionStateFor: anIndex [
	"Return the current state of the item -if selected or not - in a multiple selection list"
	"Answer true if the item at index _anIndex_ is selected"
	
	^ (multiSelectionHolder at: anIndex ifAbsent: [ ^ false ]) == true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>initialize [
	super initialize.
	self initializeValueHolders.	
	self registerEvents.

	self
		bindKeyCombination: Character space
		toAction: [ self clickOnSelectedItem ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>initializeValueHolders [
	selectionHolder := SelectionValueHolder new.
	listHolder := Array new asValueHolder.
	sortingBlockHolder := self defaultSortingBlock asValueHolder.
	filteringBlockHolder := self defaultFilteringBlock asValueHolder.
	wrapBlockHolder := [ :object | object asStringOrText ] asValueHolder.
	menuHolder := [ :menu :shifted | nil ] asValueHolder.
	multiSelectionHolder := IdentityDictionary new asValueHolder.
	multiSelection := false asValueHolder.
	allowToSelect := true asValueHolder.
	backgroundColorBlock := [ :item :index | Smalltalk ui theme backgroundColor ] asValueHolder.
	autoDeselect := true asValueHolder.
	listAnnouncer := Announcer new.

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>items: aList [
	"Set the items of the list.
	aList is a collection of your domain specific items.
	Use a two stages notification (issue 7420)."

	"<api: #st getter: #listItems registration: #whenListChanged:>"
	| oldContents |
	oldContents := listHolder value.
	listHolder value: (aList sorted: sortingBlockHolder value).
	listAnnouncer announce: (ValueChanged oldValue: oldContents newValue: listHolder value)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>listElementAt: anIndex [
	"Return the item at index _anIndex_"
	
	^ self listItems at: anIndex ifAbsent: [ nil ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>listElementAt: anIndex ifAbsent: aBlock	 [
	"Return the item at index _anIndex_"
	
	^ self listItems at: anIndex ifAbsent: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>listItems [
	"<api: #inspect>"
	"Return the items of the list. They are your domain specific items"
	
	^ listItemsCache ifNil: [ listItemsCache :=  filteringBlockHolder value value: listHolder value ]
	
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>listSize [
	"<api: #inspect>"
	"Return the size of the list"
	
	^ self listItems size
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>menu [
	"<api: #inspect>"
	"Return the block used to defined the menu"
	
	^ menuHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>menu: aBlock [
	"<api: #block getter: #menu registration: #whenMenuChanged:>"
	"Set the block used to defined the menu"
	
	menuHolder value: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>menu: aMenu shifted: aBoolean [
	"Build the menu when you right click on an item"

	^ menuHolder value cull: aMenu cull: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>multiSelection [
	"<api: #inspect>"
	"Return true if the list has a multiple selection.
	False if the list has a single selection"
	
	^ multiSelection value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>multiSelection: aBoolean [
	"<api: #boolean getter: #multiSelection registration: #whenMultiSelectionChanged:>"

	"Make the list selection become multiple if aBoolean is true.
	Otherwise set the selection as single"

	multiSelection value: aBoolean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>refreshListItems [

	listItemsCache := nil.
	^ self changed: #listElementAt:
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>registerEvents [

	listHolder whenChangedDo: [ self refreshListItems ].
	filteringBlockHolder whenChangedDo: [ self refreshListItems ].
	selectionHolder index whenChangedDo: [ self changed: #getIndex ].
	multiSelection whenChangedDo: [ :b | self changed: { #setMultipleSelection: . b } ].
	wrapBlockHolder whenChangedDo:[ self changed: #listElementAt: ].
	backgroundColorBlock whenChangedDo: [ self refreshListItems ].
	autoDeselect whenChangedDo: [ :boolean | self changed: #autoDeselect: with: { boolean }].
	sortingBlockHolder
		whenChangedDo: [ 
			listHolder value: (listHolder value sorted: sortingBlockHolder value).
			self changed: #listElementAt: ].

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>resetFilteringBlock [
	"<api: #do>"
	"Reset the filtering block with the default value which consists in showing everything"

	filteringBlockHolder value: self defaultFilteringBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>resetListSelection [
	"Reset the selection manager for multiple selection lists"
	
	multiSelectionHolder removeAll
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>resetSelection [
	"<api: #do>"
	"Unselect every items"

	selectionHolder reset.
	multiSelectionHolder removeAll
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>resetSortingBlock [
	"<api: #do>"
	"Reset the sortering block with the default value which consists in not sorting"

	sortingBlockHolder value: self defaultSortingBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>selectAll [
	self listItems withIndexDo: [ :each :i | self setSelectionStateFor: i at: true ].
	self changed: #listElementAt:
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>selectedIndex [
	"<api: #inspect>"
	"Return the index of the selected item
	In the case of a multiple selection list, it returns the last selected item"

	^ self getIndex
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>selectedIndexes [
	"<api: #inspect>"
	"Return the indexes of selected items on the case of a multiple selection list"
	
	^ multiSelectionHolder keys select: [:index | multiSelectionHolder at: index ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>selectedItem [
	"<api: #inspect>"
	"Return the selected item.
	In the case of a multiple selection list, it returns the last selected item"
	
	^ self selectedItemHolder value
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>selectedItemHolder [

	^ selectionHolder selection
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>selectedItems [
	"<api: #inspect>"
	"Return all the selected items in the case of a multiple selection list"

	^ multiSelectionHolder keys select: [:index | multiSelectionHolder at: index ] thenCollect: [:index | self listElementAt: index ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>selectedItemsSorted [
	
	"return all the selected items sorted by their index"

	^ (multiSelectionHolder keys 
			select: [:index | multiSelectionHolder at: index ]) sort 
				collect: [:index | self listElementAt: index ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>setIndex: anIndex [
	"Set the index of the selected item when you click on an item"

	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	selectionHolder index value: anIndex.
	selectionHolder selection value: (self listElementAt: anIndex).
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>setSelectedIndex: anIndex [
	"<api: #integer min: 0 max: #listSize getter: #selectedIndex registration: #whenSelectionIndexChanged:>"
	"Set the index of the item you want to be selected"
	| idx selection |
	
	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	
	idx := anIndex min: self listSize.
	selection := self 
					listElementAt: idx 
					ifAbsent: [ idx := 0.
								nil ].

	selectionHolder index value: idx.
	selectionHolder selection value: selection.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>setSelectedItem: anItem [
	"<api: #st getter: #selectedItem registration: #whenSelectedItemChanged:>"
	"Set the item you want to be selected"
	| index |

	self okToChange ifFalse: [ ^ self ].
	index := self listItems identityIndexOf: anItem ifAbsent: [ ^ self ].
	selectionHolder index value: index.
	selectionHolder selection value: anItem
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>setSelectionStateFor: anIndex at: aBoolean [
	"Set the selection state of the item at index _anIndex_ in the case of multiple selection list"

	self allowToSelect ifFalse: [ ^ self ].
	^ multiSelectionHolder at: anIndex put: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>sortingBlock [
	"<api: #inspect>"
	"Return the ordering of the items"
	
	^ sortingBlockHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>sortingBlock: aBlock [
	"<api: #block getter: #sortingBlock registration: #whenSortingBlockChanged:>"
	"To set the ordering of the items"
	
	sortingBlockHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>updateList [
	"<api: #do>"
	"Refresh the list"
	
	self changed: #listElementAt:.
	self resetSelection
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenAllowToSelectChanged: aBlock [
	"Set a block to value when the value of allowToSelect has changed"
	
	allowToSelect whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenAutoDeselectChanged: aBlock [
	"Set a block to value when the value of autoDeselect has changed"
	
	autoDeselect whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenBackgroundColorBlockChanged: aBlock [
	"Set a block to value when the backgroundColorBlock has changed"
	
	backgroundColorBlock whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenDisplayBlockChanged: aBlock [
	"Set a block to value when the filtering block has changed"
	
	wrapBlockHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenFilteringBlockChanged: aBlock [
	"Set a block to value when the filtering block block has changed"
	
	filteringBlockHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenListChanged: aBlock [
	"Specify a block to value after the contents of the list has changed"
	"Basically when you set a new list of items"
	"<api: #event>"
	| block |
	block := [ :announcement :ann | 
	aBlock
		cull: announcement newValue
		cull: announcement oldValue
		cull: announcement
		cull: ann ].
	
	listAnnouncer
		when: ValueChanged
		do: block
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenMenuChanged: aBlock [
	"Set a block to value when the menu block has changed"
	
	menuHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenMultiSelectionChanged: aBlock [
	"Set a block to value when the multiSelection value has changed"
	
	multiSelection whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenSelectedItemChanged: aBlock [
	"Set a block to value when the select item is changed"
	
	selectionHolder selection whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenSelectionChanged: aBlock [
	"Set a block to value when the selection of the list has changed"

	"The method should be used only if you are interested in the fact that there was a change, without caring about what has changed
	If you are interested in the items, use whenSelectedItemChanged:
	If you are interested in the index, use whenSelectionIndexChanged:"

	selectionHolder whenChangedDo: aBlock.
	multiSelectionHolder whenChangedDo: aBlock.
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenSelectionIndexChanged: aBlock [
	"Set a block to value when the selection index has changed"
	
	selectionHolder index whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>whenSortingBlockChanged: aBlock [
	"Set a block to value when the sorting block has changed"
	
	sortingBlockHolder whenChangedDo: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>wrapItem: anObject  [
	"Return the item _anObject_ wrapped"

	^ wrapBlockHolder value cull: anObject 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ListModel>>wrapItem: anObject index: index [
	"Return the item _anObject_ wrapped"

	^ wrapBlockHolder value cull: anObject cull: index
]
