"
An IconListModel is a spec model for icon list.
See AbstractWidgetModel

self example

You can also have a look at ExampleListModel >> exampleIconList for another example.

I provide the following variables icons and its accessors, it is a block that convert an item in the icon to display near the item.

todo
- getIconFor:
"
Class {
	#name : #IconListModel,
	#superclass : #ListModel,
	#instVars : [
		'iconHolder'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 6/28/2016 13:27'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
IconListModel class>>adapterName [

	^ #IconListAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
IconListModel class>>defaultSpec [
	<spec: #default>
	
	^ #(IconListAdapter
		adapt: #(model))
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:18'
}
IconListModel class>>example [
	| example |
	example := self new.
	example
		icons: [ :e | example iconNamed: #forwardIcon ];
		items: (1 to: 10) asArray;
		openWithSpec.
	^ example
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
IconListModel>>getIconFor: anItem [

	^ iconHolder value cull: anItem cull: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
IconListModel>>icons [
	"<api: #inspect>"
	"Return the block which takes an item as argument and returns the icon to display in the list"
	
	^ iconHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
IconListModel>>icons: aBlock [
	"<api: #block getter: #icon registration: #whenIconsChanged: >"
	"Set a block which takes an item as argument and returns the icon to display in the list"
	iconHolder value: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
IconListModel>>initialize [

	super initialize.

	iconHolder := [:item | nil ] asValueHolder.
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
IconListModel>>whenIconsChanged: aBlock  [
	
	iconHolder whenChangedDo: aBlock 


]
