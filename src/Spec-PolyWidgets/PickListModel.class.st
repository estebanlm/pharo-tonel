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
	#category : #Spec-PolyWidgets-ListAndTree
}

{ #category : #specs }
PickListModel class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed 
		add: #listModel;
		yourself
]

{ #category : #example }
PickListModel class >> example [
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

{ #category : #specs }
PickListModel class >> title [

	^ 'Pick List Example'
]

{ #category : #private }
PickListModel >> addPicked: item [

	pickedItemsHolder add: item.
	pickedItemsHolder valueChanged: true to: item.
]

{ #category : #accessing }
PickListModel >> blockToPerformOnWrappers [

	^ blockToPerformOnWrappers value
]

{ #category : #accessing }
PickListModel >> blockToPerformOnWrappers: aBlock [

	blockToPerformOnWrappers value: aBlock
]

{ #category : #api }
PickListModel >> checkboxFor: anItem [

	^ associationsItemToWrapper at: anItem ifAbsent: [ nil ]
]

{ #category : #api }
PickListModel >> defaultValue [

	^ defaultValueHolder value
]

{ #category : #api }
PickListModel >> defaultValue: aBoolean [

	defaultValueHolder value: aBoolean
]

{ #category : #api }
PickListModel >> displayBlock: aBlock [

	wrapHolder value: aBlock
]

{ #category : #api }
PickListModel >> indexFor: aCheckbox [

	^ listModel listItems indexOf: aCheckbox.
]

{ #category : #initialization }
PickListModel >> initialize [

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

{ #category : #initialization }
PickListModel >> initializePresenter [
	labelClickableHolder
		whenChangedDo:
			[ :aBoolean | associationsWrapperToItem keysDo: [ :e | e labelClickable: aBoolean ] ].
	defaultValueHolder
		whenChangedDo: [ :value | associationsWrapperToItem keysDo: [ :cb | cb state: value ] ]
]

{ #category : #initialization }
PickListModel >> initializeWidgets [
	
	listModel := self newList.
	listModel displayBlock: [ :item | item ].
	self focusOrder add: listModel
]

{ #category : #api }
PickListModel >> itemFor: aCheckbox [

	^ associationsWrapperToItem at: aCheckbox ifAbsent: [ nil ]
]

{ #category : #api }
PickListModel >> items: aCollection [

	associationsWrapperToItem removeAll.
	pickedItemsHolder removeAll.
	listModel items: (aCollection collectWithIndex: [:e :i | self wrap: e at: i ]).
]

{ #category : #api }
PickListModel >> labelClickable [
	
	^ labelClickableHolder value
]

{ #category : #api }
PickListModel >> labelClickable: aBoolean [

	labelClickableHolder value: aBoolean
]

{ #category : #accessing }
PickListModel >> listModel [

	^ listModel
]

{ #category : #api }
PickListModel >> pickedItems [
	"Returns the selected items according to the order they have been picked"
	
	^ pickedItemsHolder value
]

{ #category : #private }
PickListModel >> removePicked: item [

	pickedItemsHolder remove: item ifAbsent: [ ^ self ].
]

{ #category : #api }
PickListModel >> resetSelection [

	listModel resetSelection
]

{ #category : #api }
PickListModel >> selectedIndex [

	^ listModel selectedIndex
]

{ #category : #api }
PickListModel >> selectedItem [

	^ associationsWrapperToItem 
		at: listModel selectedItem
		ifAbsent: [ nil ]
]

{ #category : #api }
PickListModel >> selectedItems [
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

{ #category : #api }
PickListModel >> setSelectedIndex: anIndex [

	listModel setSelectedIndex: anIndex
]

{ #category : #api-events }
PickListModel >> whenListChanged: aBlock [

	listModel whenListChanged: aBlock
]

{ #category : #api-events }
PickListModel >> whenPickedItemsChanged: aBlock [

	pickedItemsHolder whenChangedDo: aBlock
]

{ #category : #api-events }
PickListModel >> whenSelectedItemChanged: aBlock [
	| newBlock |
	
	newBlock := [ :item | aBlock cull: (associationsWrapperToItem at: item ifAbsent: [ nil ])].
	listModel whenSelectedItemChanged: newBlock
]

{ #category : #api-events }
PickListModel >> whenSelectionChanged: aBlock [

	"The method should be used only if you are interested in the fact that there was a change, without caring about what has changed
	If you are interested in the items, use whenSelectedItemChanged:
	If you are interested in the index, use whenSelectionIndexChanged:"

	listModel whenSelectionChanged: aBlock.
]

{ #category : #api-events }
PickListModel >> whenSelectionIndexChanged: aBlock [

	listModel whenSelectionIndexChanged: aBlock
]

{ #category : #private }
PickListModel >> wrap: item at: index [
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

{ #category : #accessing }
PickListModel >> wrapHolder [

	^ wrapHolder
]

{ #category : #api }
PickListModel >> wrappers [

	^ associationsWrapperToItem keys
]
