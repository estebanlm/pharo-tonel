"
A DropListModel is a Spec model for drop lists.

I am assume there is a little problem on an empty list, but frankly, who creates an empty drop list ?

See DropListExample for an example
"
Class {
	#name : #DropListModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'listHolder',
		'selectionHolder',
		'displayBlock',
		'iconHolder'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel class>>adapterName [

	^ #DropListAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel class>>defaultSpec [
	<spec>
	
	^ #(DropListAdapter
		adapt: #(model))
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel class>>title [

	^ 'Drop List'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>addItemLabeled: aString do: aBlock [

	| item |
	item := DropListItem named: aString do: aBlock.
	
	"If you add directly in the contents, the update is not triggered from the value holder"
	listHolder add: item.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>addItemLabeled: aString do: aBlock icon: anIcon [

	| item |
	item := DropListItem named: aString do: aBlock.
	item icon: anIcon.
	"If you add directly in the contents, the update is not triggered from the value holder"
	listHolder add: item.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>displayBlock [
	
	^ displayBlock value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>displayBlock: aBlock [
	
	displayBlock value: aBlock 
	"listHolder replace: [ :e | e display: aBlock; yourself  ]."
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>displayForItem: anItem [
	"The order of the arguments may look weird, but then it seems more natural while using the widget"
	
	^ self displayBlock cull: anItem model cull: anItem
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>emptyList [
	
	listHolder value: OrderedCollection new
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>getIconFor: anItem [

	^ self iconHolder cull: anItem
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>getIndex [

	^ selectionHolder index value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>getList [

	^ listHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>iconHolder [

	^ iconHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>iconHolder: aBlock [
	
	iconHolder value: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>initialize [

	super initialize.

	listHolder := OrderedCollection new asValueHolder.
	selectionHolder := SelectionValueHolder new.
	
	listHolder whenChangedDo: [ 
					self changed: #getList.
					self changed: #getIconFor:.
					self internalResetSelection.].
				
	selectionHolder whenChangedDo: [ self changed: #getIndex ].
	displayBlock := [ :model :item | item label ] asValueHolder.
	iconHolder := [ :model :item | item icon ] asValueHolder.
	
	self whenSelectedItemChanged: [:item | item value ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>internalResetSelection [

	selectionHolder reset.
	self getList ifNotEmpty: [ self silentlySetSelectedIndex: 1 ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>items: aList [
	"Populate the drop list with a list of ui specific items"
	"aList is a list of domain specific objects. If you want to specify more precisely the item actions, see #addItemLabeled:do:"
	"<api: #st getter: #listItems>"
	
	| dropListItems |
	dropListItems := aList collect: [ :e | DropListItem on: e do: [] ].
	listHolder value: dropListItems
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>listItems [
	"<api: #inspect>"
	"Return the list used to populate the drop list"
	
	^ listHolder value collect: [ :e | e model ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>listSize [
	"<api: #inspect>"
	"Return the size of the list of choices"

	^ self listItems size
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>resetSelection [
	"<api: #do>"
	"Reset the current selection state"

	selectionHolder reset
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>selectedIndex [
	"<api: #inspect>"
	"Useless method but it provides a better and more consistent API"

	^ self getIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>selectedIndexHolder [

	^ selectionHolder index
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>selectedItem [
	"<api: #inspect>"

	^ self selectedItemHolder value model
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>selectedItemHolder [

	^ selectionHolder selection
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>setIndex: anIndex [
	| item |

	selectionHolder index value: anIndex.
	item := (listHolder value at: anIndex ifAbsent: [ nil ]).
	item value.
	selectionHolder selection value: item.
	self changed: #getIndex
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>setSelectedIndex: anIndex [
	"<api: #integer min:1 max:#listSize getter: #selectedIndex>"
	"Force the selection of the item at index anIndex"
	| selection |

	selection := listHolder value at: anIndex ifAbsent: [ ^ self ].
	selection value.
	selectionHolder index value: anIndex.
	selectionHolder selection value: selection
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>setSelectedItem: anItem [
	"Force the selection of the item anItem"
	"<api: #st getter: #selectedItem>"
	| index realItem |
	index := self listItems indexOf: anItem ifAbsent: [ ^ self ].
	realItem := listHolder at: index.
	selectionHolder index value: index.
	selectionHolder selection value: realItem.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>silentlySetSelectedIndex: anIndex [
	"Force the selection of the item at index anIndex"
	| selection |

	selection := listHolder value at: anIndex ifAbsent: [ ^ self ].
	selectionHolder index value: anIndex.
	selectionHolder selection value: selection.
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>whenSelectedItemChanged: aBlock [
	"Set a block to perform when the selected item is changed"

	selectionHolder selection whenChangedDo: [ :new :old :announcement :ann | 
		aBlock cull: (new ifNotNil: [ :item | item model ]) cull: old cull: announcement cull: ann ]
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>whenSelectionChanged: aBlock [
	"Set a block to perform when the selection is changed"
	
	"The method should be used only if you are interested in the fact that there was a change, without caring about what has changed
	If you are interested in the items, use whenSelectedItemChanged:
	If you are interested in the index, use whenSelectionIndexChanged:"

	selectionHolder whenChangedDo: aBlock.
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
DropListModel>>whenSelectionIndexChanged: aBlock [
	"Set a block to perform when the selected index is changed"

	selectionHolder index whenChangedDo: aBlock
]
