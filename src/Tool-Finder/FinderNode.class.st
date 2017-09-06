"
A FinderNode is an abstract class used by the tree of FinderUI
"
Class {
	#name : #FinderNode,
	#superclass : #MorphTreeNodeModel,
	#category : #Tool-Finder,
	#timestamp : '<historical>'
}

{
	#category : #'events handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>addInspectMenuItem: menu [

	menu
		add: 'Inspect (i)'
		target: self
		selector: #inspectItem.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>browse [

	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>browseClass [

	^ Smalltalk tools browser openOnClass: self item
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>displayString [
	
	^ self item asString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>doubleClick [
	self browse
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>hasParentNode [
	^ self parentNode isNil not
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>inspectItem [
	self item inspect
]

{
	#category : #'events handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>keyStroke: anEvent [
	(anEvent controlKeyPressed or: [ anEvent commandKeyPressed ]) ifFalse: [ ^ false ].
	anEvent keyCharacter == $b ifTrue: [ ^ self browse ].
	anEvent keyCharacter == $i ifTrue: [ ^ self inspectItem ].
]

{
	#category : #'events handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderNode>>menu: menu shifted: aBoolean [
	menu
		add: 'Browse (b)'
		target: self
		selector: #browse.
	self addInspectMenuItem: menu.
		
	menu addLine.
	menu
		add: 'Expand All'
		target: self model
		selector: #expandAll.
	menu
		add: 'Collapse All'
		target: self model
		selector: #collapseAll.
	^menu
]
