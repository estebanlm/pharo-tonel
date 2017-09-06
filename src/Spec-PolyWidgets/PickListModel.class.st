"
A PickList is a tick list done using spec.

self example
"
Class {
	#name : #PickListModel,
	#superclass : #ComposableModel,
	#instVars : [
		'defaultValueHolder',
		'labelClickableHolder',
		'listModel',
		'pickedItemsHolder',
		'wrapHolder',
		'associationsItemToWrapper',
		'associationsWrapperToItem',
		'associationsIndexToWrapper',
		'blockToPerformOnWrappers'
	],
	#category : #Spec-PolyWidgets-ListAndTree,
	#timestamp : 'Spirita 7/28/2016 13:26'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed 
		add: #listModel;
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel class>>example [
	| example |
	example := self new.
	example
		items:
			{{1 . 2 . 4}.
			'Foo'.
			123}.
	example openWithSpec.
			^example
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel class>>title [

	^ 'Pick List Example'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>addPicked: item [

	pickedItemsHolder add: item.
	pickedItemsHolder valueChanged: true to: item.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>blockToPerformOnWrappers [

	^ blockToPerformOnWrappers value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>blockToPerformOnWrappers: aBlock [

	blockToPerformOnWrappers value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>checkboxFor: anItem [

	^ associationsItemToWrapper at: anItem ifAbsent: [ nil ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>defaultValue [

	^ defaultValueHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>defaultValue: aBoolean [

	defaultValueHolder value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>displayBlock: aBlock [

	wrapHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>indexFor: aCheckbox [

	^ listModel listItems indexOf: aCheckbox.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>initialize [

	wrapHolder := [ :i | i printString ] asValueHolder. 
	pickedItemsHolder := OrderedCollection new asValueHolder.
	associationsWrapperToItem := Dictionary new asValueHolder.
	associationsItemToWrapper := Dictionary new asValueHolder.
	associationsIndexToWrapper := Dictionary new asValueHolder.
	labelClickableHolder := true asValueHolder.
	defaultValueHolder := false asValueHolder.
	blockToPerformOnWrappers := [:wrapper | ] asValueHolder.
	
	super initialize.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>initializePresenter [
	labelClickableHolder
		whenChangedDo:
			[ :aBoolean | associationsWrapperToItem keysDo: [ :e | e labelClickable: aBoolean ] ].
	defaultValueHolder
		whenChangedDo: [ :value | associationsWrapperToItem keysDo: [ :cb | cb state: value ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>initializeWidgets [
	
	listModel := self newList.
	listModel displayBlock: [ :item | item ].
	self focusOrder add: listModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>itemFor: aCheckbox [

	^ associationsWrapperToItem at: aCheckbox ifAbsent: [ nil ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>items: aCollection [

	associationsWrapperToItem removeAll.
	pickedItemsHolder removeAll.
	listModel items: (aCollection collectWithIndex: [:e :i | self wrap: e at: i ]).
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>labelClickable [
	
	^ labelClickableHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>labelClickable: aBoolean [

	labelClickableHolder value: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>listModel [

	^ listModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>pickedItems [
	"Returns the selected items according to the order they have been picked"
	
	^ pickedItemsHolder value
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>removePicked: item [

	pickedItemsHolder remove: item ifAbsent: [ ^ self ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>resetSelection [

	listModel resetSelection
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>selectedIndex [

	^ listModel selectedIndex
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>selectedItem [

	^ associationsWrapperToItem 
		at: listModel selectedItem
		ifAbsent: [ nil ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>selectedItems [
	"Returns the selected items according to the list order"
	| wrappers items |
	
	wrappers := listModel listItems.
	items := wrappers collect: [:e || value |
		value := associationsWrapperToItem at: e ifAbsent: [ nil ].
		(value isNil or: [ e state not ])
			ifTrue: [ nil ]
			ifFalse: [ value ]] thenSelect: [ :e | e notNil ].
	^ items
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>setSelectedIndex: anIndex [

	listModel setSelectedIndex: anIndex
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>whenListChanged: aBlock [

	listModel whenListChanged: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>whenPickedItemsChanged: aBlock [

	pickedItemsHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>whenSelectedItemChanged: aBlock [
	| newBlock |
	
	newBlock := [ :item | aBlock cull: (associationsWrapperToItem at: item ifAbsent: [ nil ])].
	listModel whenSelectedItemChanged: newBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>whenSelectionChanged: aBlock [

	"The method should be used only if you are interested in the fact that there was a change, without caring about what has changed
	If you are interested in the items, use whenSelectedItemChanged:
	If you are interested in the index, use whenSelectionIndexChanged:"

	listModel whenSelectionChanged: aBlock.
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>whenSelectionIndexChanged: aBlock [

	listModel whenSelectionIndexChanged: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>wrap: item at: index [
	| checkBox |

	associationsIndexToWrapper 
		at: index
		ifPresent: [:cb | ^ cb ].

	checkBox := self instantiate: CheckBoxModel.
	blockToPerformOnWrappers value value: checkBox.
	checkBox label: (wrapHolder value cull: item cull: self).
	
	checkBox whenActivatedDo: [ 
		self addPicked: item.
		listModel setSelectedItem: checkBox.
		listModel takeKeyboardFocus ].
	
	checkBox whenDeactivatedDo: [ 
		self removePicked: item.
		listModel setSelectedItem: checkBox.
		listModel takeKeyboardFocus ].
	
	checkBox 
		state: self defaultValue;
		labelClickable: self labelClickable.
		
	associationsWrapperToItem at: checkBox put: item.
	associationsItemToWrapper at: item put: checkBox.
	associationsIndexToWrapper at: index put: checkBox.
	^ checkBox
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>wrapHolder [

	^ wrapHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
PickListModel>>wrappers [

	^ associationsWrapperToItem keys
]
