"
Dialog for choosing from a list of items
"
Class {
	#name : #DialogItemsChooser,
	#superclass : #Object,
	#instVars : [
		'methodNameUI',
		'choicesList',
		'selection',
		'unselectedItems',
		'selectedItems',
		'resultList',
		'model',
		'title',
		'selectedItemsSetterSelector',
		'unselectedLabel',
		'selectedLabel'
	],
	#category : #Tool-Finder,
	#timestamp : 'TorstenBergmann 2/4/2014 20:44'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser class>>on: aModel unselectedItems: unselectedItems selectedItems: selectedItems selectedItemsSetterSelector: anotherSelector title: aString unselectedItemsLabel: unselectedLabel selectedItemsLabel: selectedLabel [
	| instance |
	instance := self new 
					model: aModel;
					unselectedItems: unselectedItems;
					selectedItems: selectedItems;
					selectedItemsSetterSelector: anotherSelector;
					title: aString;
					unselectedLabel: unselectedLabel;
					selectedLabel: selectedLabel.
	^instance.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>choicesList [
	^ choicesList ifNil: [ choicesList := OrderedCollection new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>choicesList: anObject [

	choicesList := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>initialize [
	super initialize.
	selection := OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>methodNameUI [

	^ methodNameUI
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>methodNameUI: anObject [

	methodNameUI := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>model [
	^model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>model: aModel [
	model := aModel
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>open [

	(DialogItemsChooserUI on: self)
			title: self title;
			openInWorld
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>resultList [
	^ resultList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>resultList: aList [
	resultList := aList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>selectedItems [

	^ selectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>selectedItems: anObject [

	selectedItems := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>selectedItemsSetterSelector [
	^selectedItemsSetterSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>selectedItemsSetterSelector: aSelector [
	selectedItemsSetterSelector := aSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>selectedLabel [
	^selectedLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>selectedLabel: anObject [

	selectedLabel := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>selection [
	^selection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>sendSelection [
	self model perform: self selectedItemsSetterSelector with: self selectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>title [
		^title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>title: aFinderUI [
	title := aFinderUI
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>unselectedItems [

	^ unselectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>unselectedItems: anObject [

	unselectedItems := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>unselectedLabel [
	^unselectedLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
DialogItemsChooser>>unselectedLabel: anObject [

	unselectedLabel := anObject
]
