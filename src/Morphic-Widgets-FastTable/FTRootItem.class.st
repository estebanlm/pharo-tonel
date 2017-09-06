"
I represent the root item node in a FTTreeDataSource.

Description
-------------------------------------------------

I am store by a FTTreeDataSource and my children are the roots elements of the dataSource.
I store the a collection of Items build from the data of the dataSource.


Example
-------------------------------------------------
 
FTRootItem data: Object allSubclasses from: aDataSource
"
Class {
	#name : #FTRootItem,
	#superclass : #FTTreeItem,
	#category : #Morphic-Widgets-FastTable-Tree,
	#timestamp : 'CyrilFerlicot 10/30/2015 17:50'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>children [
	^ children
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>children: aCollectionOfItem  [
	children := aCollectionOfItem
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>collapseAll [
	children do: #collapseAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>data: aCollection [
	self children: (aCollection collect: [ :object | FTBasicItem data: object from: dataSource ]) asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>dataSource: anObject [
	dataSource := anObject.
	children ifNotNil: [ children do: [ :item | item dataSource: anObject ] ]
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>expandAll [
	children do: #expandAll
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>expandAllTo: aDepth [
	children do: [ :each | each expandAllTo: aDepth ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>isExpanded [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>recentlyChanged [
	"Cannot collapse root item."

	^ false
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTRootItem>>updateData [
	self children do: #updateData
]
