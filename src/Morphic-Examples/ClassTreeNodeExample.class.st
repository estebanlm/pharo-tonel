"
Example for class tree nodes
"
Class {
	#name : #ClassTreeNodeExample,
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
ClassTreeNodeExample>>browseItem [
	Smalltalk tools browser openOnClass: self item
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
ClassTreeNodeExample>>childrenItems [
	^ (self item subclasses asArray sort: [:a :b | a name < b name]) asOrderedCollection

]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
ClassTreeNodeExample>>classButton [
	^ ( self theme 
				newButtonIn: World
				for: self
				getState: nil
				action: #browseItem
				arguments: {}
				getEnabled: #enabled
				getLabel: nil
				help: 'Open a browser on ' translated , self item name)
				label: (self theme  windowLabelForText: (self item name) , '...');
				yourself
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
ClassTreeNodeExample>>commentText [
	^ ( self theme  newTextIn: World text: self item comment) unlock; wrapFlag: true; yourself
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
ClassTreeNodeExample>>contents [
	^ contents ifNil: [contents := super contents]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ClassTreeNodeExample>>exploreItem [
	self explore
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
ClassTreeNodeExample>>icon [
	^ self iconNamed: #smallExpertIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ClassTreeNodeExample>>inspectItem [
	self inspect
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ClassTreeNodeExample>>keyStroke: anEvent from: aTreeMorph  [
	| c  |
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
ClassTreeNodeExample>>menu: menu shifted: b  [
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
