"
I am a LabelledContainer specialized to manage a ListModel.
See LabelledContainer

self example

I provide the accessor list to be more intuitive than subwidget.

I provide shortcuts for the most common methods of the list api to avoid the use of the DoesNotUnderstand or the writing of long chain of accessors.
"
Class {
	#name : #LabelledList,
	#superclass : #LabelledContainer,
	#category : #Spec-PolyWidgets-Labelled,
	#timestamp : 'Spirita 7/22/2016 16:39'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList class>>example [
	| example |
	example := self abstractExample.
	example
		items: {'item 1' . 'item 2'};
		openWithSpec.
	^ example
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>beMultipleSelection [
	^ self list beMultipleSelection
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>displayBlock: aBlock [
	^self list displayBlock: aBlock
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>filteringBlock: aBlock [
	^ self list filteringBlock: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>initializeWidgets [
super initializeWidgets.
	self content: ListModel
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>items: aList [
	^ self list items: aList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>list [
	^ self subwidget
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>listSize [
	^ self list listSize
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>selectAll [
	^ self list selectAll
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>selectedItem [
	^ self list selectedItem
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>selectedItems [
	^ self list selectedItems
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>sortingBlock: aBlock [
	^self list sortingBlock: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>whenSelectedItemChanged: aBlock [
self list whenSelectedItemChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>whenSelectionChanged: aBlock [
	self list whenSelectionChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledList>>whenSelectionIndexChanged: aBlock [
	self list whenSelectionIndexChanged: aBlock
]
