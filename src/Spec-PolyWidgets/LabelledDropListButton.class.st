"
I am a LabelledContainer specialized to manage a DropListButton.
See LabelledContainer

self example

I provide the accessors dropListButton to be more intuitive than subwidget, and the shortcuts button and dropList.

I provide shortcuts for the most common methods to avoid the use of the DoesNotUnderstand or the writing of long chain of accessors.
"
Class {
	#name : #LabelledDropListButton,
	#superclass : #LabelledContainer,
	#category : #Spec-PolyWidgets-Labelled,
	#timestamp : 'Spirita 7/25/2016 16:52'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton class>>defaultSpec [
	<spec: #default>
	^ super labelLeft 
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton class>>example [
	| example |
	example := self abstractExample.
	example button label: 'I am a button'.
	example
		items: {'item 1' . 'item 2'};
		displayBlock: [ :item | item asString ];
		extent: 550 @ 50;
		openWithSpec.
	^ example
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton class>>exampleUse [
	| example |
	example := self new.
	example button label: 'Add'.
	example label: 'Compose your team';
		displayBlock: [ :item | item asString ];
		items: {'Swordian' . 'Gardian' . 'Wizard' . 'Sniper'};
		extent: 300 @ 120;
		title: 'LabelDropButton example of use';
		openWithSpec: #labelTop.
	^ example
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>action: aBlock [
	^self button action: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>button [
	^ self dropListButton button
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>displayBlock: aBlock [
	^self dropList displayBlock: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>dropList [
	^ self dropListButton dropList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>dropListButton [
	^ subwidget
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>emptyList [
	^self dropList emptyList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>icon: anIcon [
^	self button icon: anIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>initializeWidgets [
super initializeWidgets.
	self content: DropListButton.
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>items: aList [
	^self dropList items: aList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>listSize [
	^ self dropList listSize
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>resetSelection [
^	self dropList resetSelection
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>selectedItem [
	^ self dropList selectedItem
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>setIndex: anIndex [
	^ self dropList setIndex: anIndex
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>whenSelectedItemChanged: aBlock [
	self dropList
		whenSelectedItemChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>whenSelectionChanged: aBlock [
	self dropList
		whenSelectionChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledDropListButton>>whenSelectionIndexChanged: aBlock [
	self dropList
		whenSelectionIndexChanged: aBlock
]
