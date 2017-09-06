"
This widget allows you to edit a list of items :
- add / remove an item to/from the list 
- order the list by moving elements up/down/top/bottom.

The default behavior is to do a copy of the list. The widget works with its internal copy. It allows the user to accept / reject changes (for example by opening the widget in a DialogWindow) before affecting the original list. It is your responsability to copy EditableList items back to the original list.

The addItemBlock is used to provide a way to give the item to add (e.g. a UIManager default chooseFrom: values:).

Example:
self example
"
Class {
	#name : #EditableList,
	#superclass : #ComposableModel,
	#instVars : [
		'title',
		'list',
		'addButton',
		'removeButton',
		'upButton',
		'downButton',
		'topButton',
		'bottomButton',
		'addItemBlock',
		'okBlock'
	],
	#category : #Spec-PolyWidgets-ListAndTree,
	#timestamp : '<historical>'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList class>>example [
	^self new
	
		title: 'Selectors list';
		list: self selectors;
	 openWithSpec
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList class>>new: aCollection [
	^ self new list: aCollection copy.
		
]

{
	#category : #spec,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList class>>spec [
	<spec: #default>
	^ SpecLayout composed
		newColumn:
			[ :column | 
			column
				newRow: [ :menuRow | 
							menuRow
								add: #addButton;
								add: #removeButton ]
					height: 25;
				newRow: [ :listRow | 
							listRow
								newColumn: [ :c1 | c1 add: #list ];
								newColumn: [ :c2 | 
											c2
												add: #topButton;
												add: #upButton;
												add: #downButton;
												add: #bottomButton ]
									width: 24 ] ] 
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>addButton [
	^ addButton
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>addItemBlock: aBlock [
	addItemBlock := aBlock.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>bottomButton [
	^ bottomButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>downButton [
	^ downButton
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>initialize [
	"Initialization code for EditableList"

	title := 'Title' asValueHolder.
	
	super initialize.
	okBlock := [ ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>initializeDialogWindow: aWindow [
	super initializeDialogWindow: aWindow.
	aWindow okAction: [ self performOkAction ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>initializePresenter [
	super initializePresenter
	
	addButton action: [ | requirement | 
						requirement := addItemBlock value.
						requirement ifNotNil: [ 
							self list: (self list listItems copyWith: requirement) ] ].

	removeButton
		action: [ self list: (list listItems copyWithoutIndex: list selectedIndex) ].
		
	topButton
		action: [ self moveElementAt: list selectedIndex to: 1 ].
	bottomButton
		action: [ self moveElementAt: list selectedIndex to: list listItems size ].
	upButton
		action: [ self moveElementAt: list selectedIndex to: list selectedIndex - 1].
	downButton
		action: [ self moveElementAt: list selectedIndex to: list selectedIndex + 1].

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>initializeWidgets [
	list := self instantiate: FastTableModel.
	addButton := self newButton.
	removeButton := self newButton.
	upButton := self newButton.
	downButton := self newButton.
	topButton := self newButton.
	bottomButton := self newButton.
	addButton
		icon: (self iconNamed: #addIcon);
		help: 'Add a new item to the list'.
	removeButton
		icon: (self iconNamed: #deleteIcon);
		help: 'Remove a item from the list'.
	upButton
		icon: (self iconNamed: #upIcon);
		help: 'Move this item up from one element'.
	downButton
		icon: (self iconNamed: #downIcon);
		help: 'Move this item down from one element'.
	topButton
		icon: (self iconNamed: #topIcon);
		help: 'Move this item on the first position of the list'.
	bottomButton
		icon: (self iconNamed: #bottomIcon);
		help: 'Move this item on the last position of the list'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>list [
	^ list
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>list: aList [
	list items: aList.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>moveElementAt: index to: newIndex [
	| elementToMove orderedList |
	
	(newIndex < 1 or: [ newIndex > list listItems size ]) ifTrue: [ ^self ].
	
	elementToMove := list listItems at: index.	
	orderedList := list listItems asOrderedCollection
		removeAt: index;
		add: elementToMove beforeIndex: newIndex;
		yourself.
	self list: orderedList.
	self list setSelectedIndex: newIndex.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>okAction: aBlock [

	okBlock := aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>performOkAction [

	okBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>removeButton [
	^ removeButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>title [
	^ title value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>title: aTitle [
	title := aTitle 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>topButton [
	^ topButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
EditableList>>upButton [
	^ upButton
]
