"
Example for abstract package nodes
"
Class {
	#name : #PackageAbstractNodeExample,
	#superclass : #MorphTreeNodeModel,
	#instVars : [
		'contents'
	],
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'TorstenBergmann 2/3/2014 23:56'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageAbstractNodeExample>>browseItem [
	
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageAbstractNodeExample>>contents [
	^ contents ifNil: [contents := super contents]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageAbstractNodeExample>>doubleClick [
	self browseItem
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageAbstractNodeExample>>exploreItem [
	self explore
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageAbstractNodeExample>>inspectItem [
	self inspect
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageAbstractNodeExample>>keyStroke: anEvent from: aTreeMorph [
	| c |
	c := anEvent keyCharacter.
	c = $b
		ifTrue: [self browseItem. ^ true].
	c = $i
		ifTrue: [self inspectItem. ^ true].
	c = $I
		ifTrue: [self exploreItem. ^ true].
	^ false

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageAbstractNodeExample>>menu: menu shifted: b  [
	menu
		add: 'Expand all' 
		target: self
		selector: #expandAll.
	menu
		add: 'Browse (b)' 
		target: self
		selector: #browseItem.
	menu
		add: 'Inspect (i)' 
		target: self
		selector: #inspectItem.
	menu
		add: 'Explore (I)' 
		target: self
		selector: #exploreItem.

]
