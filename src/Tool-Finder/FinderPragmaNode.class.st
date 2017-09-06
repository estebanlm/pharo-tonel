"
A FinderPragmaNode is a Node used to render a pragma in the Finder Tree
"
Class {
	#name : #FinderPragmaNode,
	#superclass : #FinderNode,
	#category : #Tool-Finder,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>browse [
	Smalltalk tools browser openInEnvironment: (RBBrowserEnvironment default forPragmas:{ self item})
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>browseClass [

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>browseHierarchy [

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>browseReferences [

	self systemNavigation browseAllReferencesTo: self item.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>childNodeClassFromItem: anItem  [
	
	^ FinderPragmaMethodNode 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>childrenItems [
	"I search the children, if I have not got any, I call my super method"

	^ (self model resultDictionary at: self item ifAbsent:[^super childrenItems]) keys
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>displayString [
	^ '<' , self item  , '>'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>foundReceiverOf: aString [
	"It's ugly, but I haven't found a method that allows me to do that easily"

	| selector index firstPart |
	selector := (self model finder findSelector: aString).
	index := selector indexOf: $:.
	firstPart := selector.
	(index = 0)
		ifFalse: [firstPart := selector copyFrom: 1 to: index].
	index :=  aString findString: firstPart.
	^ aString copyFrom: 1 to: (index-1).
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>inspectItem [
	(RBBrowserEnvironment default forPragmas:{ self item}) methods inspect
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>keyStroke: anEvent [
	(anEvent controlKeyPressed or: [ anEvent commandKeyPressed ]) ifFalse: [ ^ false ].
	anEvent keyCharacter == $h ifTrue: [ ^ self browseHierarchy ].
	anEvent keyCharacter == $N ifTrue: [ ^ self browseReferences ].
	^ super keyStroke: anEvent.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderPragmaNode>>menu: menu shifted: aBoolean [
	menu
		add: 'References (N)'
		target: self
		selector: #browseReferences.
	^ super menu: menu shifted: aBoolean.
]
