"
A FinderClassNode is a node used by the FinderUI's tree representing a Class
"
Class {
	#name : #FinderClassNode,
	#superclass : #FinderNode,
	#category : #Tool-Finder,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderClassNode>>browse [

	self hasParentNode ifFalse: [ ^ super browseClass ].
	^ self browseClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderClassNode>>browseClass [

	^ Smalltalk tools browser openOnClass: self item selector: self parentNode item
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderClassNode>>browseHierarchy [

	self systemNavigation browseHierarchy: self item
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderClassNode>>browseReferences [

	self systemNavigation browseAllCallsOnClass: self item.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderClassNode>>childNodeClassFromItem: anItem  [
	"The children (if there are some) are instances of
	FinderMethodNode (in the case of a Classes research)"
	^ FinderMethodNode 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderClassNode>>childrenItems [
	"I search the children, if I have not got any, I call my super method"
	^ (self model resultDictionary at: self item ifAbsent:[^super childrenItems])
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderClassNode>>keyStroke: anEvent [
	(anEvent controlKeyPressed or: [ anEvent commandKeyPressed ]) ifFalse: [ ^ false ].
	anEvent keyCharacter == $h ifTrue: [ ^ self browseHierarchy ].
	anEvent keyCharacter == $N ifTrue: [ ^ self browseReferences ].
	^ super keyStroke: anEvent.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderClassNode>>menu: menu shifted: aBoolean [
	menu
		add: 'Hierarchy (h)'
		target: self
		selector: #browseHierarchy.
	menu
		add: 'References (N)'
		target: self
		selector: #browseReferences.
	^ super menu: menu shifted: aBoolean.
]
