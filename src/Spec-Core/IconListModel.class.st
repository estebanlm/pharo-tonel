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
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
IconListModel class >> adapterName [

	^ #IconListAdapter
]

{ #category : #specs }
IconListModel class >> defaultSpec [
	<spec: #default>
	
	^ #(IconListAdapter
		adapt: #(model))
]

{ #category : #example }
IconListModel class >> example [
	| example |
	example := self new.
	example
		icons: [ :e | example iconNamed: #forwardIcon ];
		items: (1 to: 10) asArray;
		openWithSpec.
	^ example
]

{ #category : #api }
IconListModel >> getIconFor: anItem [

	^ iconHolder value cull: anItem cull: self
]

{ #category : #api }
IconListModel >> icons [
	"<api: #inspect>"
	"Return the block which takes an item as argument and returns the icon to display in the list"
	
	^ iconHolder value
]

{ #category : #api }
IconListModel >> icons: aBlock [
	"<api: #block getter: #icon registration: #whenIconsChanged: >"
	"Set a block which takes an item as argument and returns the icon to display in the list"
	iconHolder value: aBlock
]

{ #category : #initialization }
IconListModel >> initialize [

	super initialize.

	iconHolder := [:item | nil ] asValueHolder.
]

{ #category : #api-events }
IconListModel >> whenIconsChanged: aBlock [ 
	
	iconHolder whenChangedDo: aBlock 


]
