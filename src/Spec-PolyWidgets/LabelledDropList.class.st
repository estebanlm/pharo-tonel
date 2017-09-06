"
I am a LabelledContainer specialized to manage a DropListModel.
See LabelledContainer

self example

I provide the accessor dropList to be more intuitive than subwidget.

I provide shortcuts for the most common methods of the droplist api to avoid the use of the DoesNotUnderstand or the writing of long chain of accessors.
"
Class {
	#name : #LabelledDropList,
	#superclass : #LabelledContainer,
	#category : #Spec-PolyWidgets-Labelled,
	#timestamp : 'Spirita 7/22/2016 16:38'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList class>>defaultSpec [
	<spec: #default>
	^ super labelLeft

]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList class>>example [
	| example |
	example := self abstractExample.
example
		items: {'item 1' . 'item 2'};
		displayBlock: [ :item | item asString ];
		extent: 400 @ 50;
		openWithSpec.
	^ example
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>displayBlock: aBlock [
	^self dropList displayBlock: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>dropList [
	^ self subwidget
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>emptyList [
	^self dropList emptyList
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>initializeWidgets [
super initializeWidgets.
	self content: DropListModel
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>items: aList [
	^self dropList items: aList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>listSize [
	^self dropList listSize
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>resetSelection [
	^self dropList resetSelection
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>selectedItem [
	^self dropList selectedItem
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>setIndex: anIndex [
	^self dropList setIndex: anIndex
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>whenSelectedItemChanged: aBlock [
	self dropList whenSelectedItemChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>whenSelectionChanged: aBlock [
	self dropList whenSelectionChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropList>>whenSelectionIndexChanged: aBlock [
	self dropList whenSelectionIndexChanged: aBlock
]
