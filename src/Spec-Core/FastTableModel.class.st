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
	#category : #Spec-Core-Widgets,
	#timestamp : 'StephanEggermont 2/1/2016 10:57'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel class>>adapterName [

	^ #FastTableAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel class>>defaultSpec [
	<spec: #default>
	
	^ #(FastTableAdapter
		adapt: #(model))
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel class>>example [
	| example |
	example := self new.
	example
		icons: [ :e | example iconNamed: #forwardIcon ];
		items: (1 to: 10) asArray;
		openWithSpec.
	^ example
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel class>>exampleMultipleSelection [
	| example |
	example := self new.
	example
		items: (1 to: 10);
		beMultipleSelection;
		whenSelectionChanged: [ :selection | selection logCr ];
		openWithSpec.
	^ example
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>columns [
	^ columns
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>doubleClick: event [

	doubleClick value cull: event
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>doubleClickAction [
	"<api: #inspect>"
	"Return the block evaluated on double click"
	
	^ doubleClick value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>doubleClickAction: aBlock [
	"<api: #block getter:#doubleClickAction registration: #whenDoubleClickActionChanged:>"
	"Set the block evaluated on double click."
	
	doubleClick value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>getIconFor: anItem [

	^ iconHolder value cull: anItem cull: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>handlesDoubleClick [

	^ handlesDoubleClick value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>handlesDoubleClick: aBoolean [
	"<api: #block getter:#handlesDoubleClick registration: #whenHandlesDoubleClickChanged:>"
	"Enable or disable double click on the list."
	
	handlesDoubleClick value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>icons [
	"<api: #inspect>"
	"Return the block which takes an item as argument and returns the icon to display in the list"
	
	^ iconHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>icons: aBlock [
	"<api: #block getter: #icon registration: #whenIconsChanged: >"
	"Set a block which takes an item as argument and returns the icon to display in the list"
	iconHolder value: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>initialize [
	super initialize.
	columns := {FTColumn new}
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>initializeValueHolders [

	super initializeValueHolders.

	iconHolder := [:item | nil ] asValueHolder.
	handlesDoubleClick := false asValueHolder.
	doubleClick := [  ] asValueHolder.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>numberOfColumns: aNumber [
	columns := ((1 to: aNumber) collect: [ :index | FTArrayIndexColumn index: index ] )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>numberOfColumns: aNumber withWidths: widths [
	columns := ((1 to: aNumber) collect: [ :index | 
		FTArrayIndexColumn index: index width: (widths at: index) ] )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>prepareForFilteredDataSourceWith: items [

	listHolder := items asValueHolder.
	listHolder whenChangedDo: [ self refreshListItems ].
	listItemsCache := nil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>registerEvents [
	super registerEvents.
	handlesDoubleClick whenChangedDo: [ :bool | self changed: { #handlesDoubleClick . bool } ].

]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
FastTableModel>>whenIconsChanged: aBlock  [
	
	iconHolder whenChangedDo: aBlock 


]
