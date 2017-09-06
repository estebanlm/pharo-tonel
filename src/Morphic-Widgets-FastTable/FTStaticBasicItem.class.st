"
I am an Item of a tree that keep a data and I keep staticly my children. I cannot regenerate them. 

Description
-------------------------------------------------

I am created by a FTTreeFunctionStrategy for some filter. For example it is hard to be able to update a Tree when you filter all his elements. In that case the FTAllItemsStrategy create me during a filter.

Public API and Key Messages
-------------------------------------------------

- #children: 	allow to set my childrens 
   
Example
-------------------------------------------------

FTStaticBasicItem new
		data: 5;
		depth: 2;
		children: aCollectionOfItems;
		yourself.
 
"
Class {
	#name : #FTStaticBasicItem,
	#superclass : #FTBasicItem,
	#category : #Morphic-Widgets-FastTable-Tree,
	#timestamp : 'CyrilFerlicot 11/2/2015 16:06'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTStaticBasicItem>>calculateChildren [
	"Not for this item."

	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTStaticBasicItem>>children [
	^ children
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTStaticBasicItem>>children: aCollectionsOfItems [
	children := aCollectionsOfItems
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTStaticBasicItem>>dataSource: anObject [
	dataSource := anObject.
	children do: [ :item | item dataSource: anObject ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:21'
}
FTStaticBasicItem>>updateData [
	"Static Item cannot do it."

	
]
