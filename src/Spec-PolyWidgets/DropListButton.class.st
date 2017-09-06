"
I am an elementary Spec widget that associates a DropListModel and a ButtonModel.

self example

I provide accessors dropList and input and shortcuts for the most common methods of their api.
"
Class {
	#name : #DropListButton,
	#superclass : #ComposableModel,
	#instVars : [
		'dropList',
		'button'
	],
	#category : #Spec-PolyWidgets-Elementary,
	#timestamp : 'Spirita 7/22/2016 16:24'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #dropList origin: 0 @ 0 corner: 0.8 @ 1;
				add: #button origin: 0.8 @ 0 corner: 1 @ 1 ];
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton class>>example [
	| example |
	example := self new.
	example
		displayBlock: [ :item | item asString ];
		items: {'Swordian' . 'Gardian' . 'Wizard' . 'Sniper'};
		label: 'Add';
		extent: 300 @ 70;
		title: 'DropListButton example';
		openWithSpec.
	^ example
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>action: aBlock [
	self button action: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>button [
	^ button
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>displayBlock: aBlock [
	self dropList displayBlock: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>dropList [
	^ dropList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>emptyList [
	self dropList emptyList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>icon: anIcon [
	self button icon: anIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>initializeWidgets [
	dropList := self instantiate: DropListModel.
	button := self instantiate: ButtonModel.
	self focusOrder
		add: dropList;
		add: button
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>items: aList [
	self dropList items: aList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>label [
	self button label
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>label: aStringOrImageMorph [
	self button label: aStringOrImageMorph
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>listSize [
	self dropList listSize
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>resetSelection [
	self dropList resetSelection
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>selectedItem [
	self dropList selectedItem
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>setIndex: anIndex [
	self dropList setIndex: anIndex
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>whenSelectedItemChanged: aBlock [
	self dropList
		whenSelectedItemChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>whenSelectionChanged: aBlock [
	self dropList
		whenSelectionChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
DropListButton>>whenSelectionIndexChanged: aBlock [
	self dropList
		whenSelectionIndexChanged: aBlock
]
