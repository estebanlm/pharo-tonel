"
I am an elementary Spec widget that associates an TextInputField and a DropListModel.

self example

I provide accessors dropList and input and shortcuts for the most common methods of their api.
"
Class {
	#name : #InputTextDropList,
	#superclass : #ComposableModel,
	#instVars : [
		'dropList',
		'input'
	],
	#category : #Spec-PolyWidgets-Elementary,
	#timestamp : 'Spirita 7/22/2016 16:24'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #input origin: 0 @ 0 corner: 0.3 @ 1;
				add: #dropList origin: 0.3 @ 0 corner: 1 @ 1 ];
			yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList class>>example [
	| ex |
	ex := self new.
	ex
		ghostText: 'a Number';
		displayBlock: [ :item | item asString ];
		items: {'Potatoes' . 'Carrots' . 'Onions'};
		extent: 350 @ 50;
		title: 'InputTextDropList example';
		openWithSpec.
	^ ex
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>acceptOnCR: aBoolean [
	self input acceptOnCR: aBoolean
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>beEncrypted [
	self input beEncrypted
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>displayBlock: aBlock [
	self dropList displayBlock: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>dropList [
	^ dropList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>emptyList [
	self dropList emptyList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>encrypted: aBoolean [
	self input encrypted: aBoolean
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>entryCompletion: anEntryCompletion [
	self input entryCompletion: anEntryCompletion
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>ghostText: aText [
	self input ghostText: aText
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>initializeWidgets [
	input := self instantiate: TextInputFieldModel.
	dropList := self instantiate: DropListModel.
	self focusOrder
		add: input;
		add: dropList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>input [
	^ input
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>items: aList [
	self dropList items: aList
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>listSize [
	self dropList listSize
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>resetSelection [
	self dropList resetSelection
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>selectedItem [
	self dropList selectedItem
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>setIndex: anIndex [
	self dropList setIndex: anIndex
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>text [
	self input text
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>text: aText [
	self input text: aText
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>whenSelectedItemChanged: aBlock [
	self dropList whenSelectedItemChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>whenSelectionChanged: aBlock [
	self dropList whenSelectionChanged: aBlock
]

{
	#category : #events-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
InputTextDropList>>whenSelectionIndexChanged: aBlock [
	self dropList whenSelectionIndexChanged: aBlock
]
