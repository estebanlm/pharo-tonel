"
An FastTableModel is a spec model for a FastTable
"
Class {
	#name : #FastTableModel,
	#superclass : #ListModel,
	#instVars : [
		'iconHolder',
		'displayBlock',
		'handlesDoubleClick',
		'doubleClick',
		'columns'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
FastTableModel class >> adapterName [

	^ #FastTableAdapter
]

{ #category : #specs }
FastTableModel class >> defaultSpec [
	<spec: #default>
	
	^ #(FastTableAdapter
		adapt: #(model))
]

{ #category : #example }
FastTableModel class >> example [
	| example |
	example := self new.
	example
		icons: [ :e | example iconNamed: #forwardIcon ];
		items: (1 to: 10) asArray;
		openWithSpec.
	^ example
]

{ #category : #example }
FastTableModel class >> exampleMultipleSelection [
	| example |
	example := self new.
	example
		items: (1 to: 10);
		beMultipleSelection;
		whenSelectionChanged: [ :selection | selection logCr ];
		openWithSpec.
	^ example
]

{ #category : #accessing }
FastTableModel >> columns [
	^ columns
]

{ #category : #api }
FastTableModel >> doubleClick: event [

	doubleClick value cull: event
]

{ #category : #api }
FastTableModel >> doubleClickAction [
	"<api: #inspect>"
	"Return the block evaluated on double click"
	
	^ doubleClick value
]

{ #category : #api }
FastTableModel >> doubleClickAction: aBlock [
	"<api: #block getter:#doubleClickAction registration: #whenDoubleClickActionChanged:>"
	"Set the block evaluated on double click."
	
	doubleClick value: aBlock
]

{ #category : #api }
FastTableModel >> getIconFor: anItem [

	^ iconHolder value cull: anItem cull: self
]

{ #category : #api }
FastTableModel >> handlesDoubleClick [

	^ handlesDoubleClick value
]

{ #category : #api }
FastTableModel >> handlesDoubleClick: aBoolean [
	"<api: #block getter:#handlesDoubleClick registration: #whenHandlesDoubleClickChanged:>"
	"Enable or disable double click on the list."
	
	handlesDoubleClick value: aBoolean
]

{ #category : #api }
FastTableModel >> icons [
	"<api: #inspect>"
	"Return the block which takes an item as argument and returns the icon to display in the list"
	
	^ iconHolder value
]

{ #category : #api }
FastTableModel >> icons: aBlock [
	"<api: #block getter: #icon registration: #whenIconsChanged: >"
	"Set a block which takes an item as argument and returns the icon to display in the list"
	iconHolder value: aBlock
]

{ #category : #initialization }
FastTableModel >> initialize [
	super initialize.
	columns := {FTColumn new}
]

{ #category : #initialization }
FastTableModel >> initializeValueHolders [

	super initializeValueHolders.

	iconHolder := [:item | nil ] asValueHolder.
	handlesDoubleClick := false asValueHolder.
	doubleClick := [  ] asValueHolder.

]

{ #category : #accessing }
FastTableModel >> numberOfColumns: aNumber [
	columns := ((1 to: aNumber) collect: [ :index | FTArrayIndexColumn index: index ] )
]

{ #category : #accessing }
FastTableModel >> numberOfColumns: aNumber withWidths: widths [
	columns := ((1 to: aNumber) collect: [ :index | 
		FTArrayIndexColumn index: index width: (widths at: index) ] )
]

{ #category : #private }
FastTableModel >> prepareForFilteredDataSourceWith: items [

	listHolder := items asValueHolder.
	listHolder whenChangedDo: [ self refreshListItems ].
	listItemsCache := nil
]

{ #category : #initialization }
FastTableModel >> registerEvents [
	super registerEvents.
	handlesDoubleClick whenChangedDo: [ :bool | self changed: { #handlesDoubleClick . bool } ].

]

{ #category : #api-events }
FastTableModel >> whenIconsChanged: aBlock [ 
	
	iconHolder whenChangedDo: aBlock 


]
