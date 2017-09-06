"
I'm the one who knows generalization to navigate an ast tree
I have two concret classes: NavigateInto and NavigateOver
"
Class {
	#name : #NNavDirection,
	#superclass : #Object,
	#classVars : [
		'Instance'
	],
	#category : #NodeNavigation-Core,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavDirection class>>calculateBestSeletionFor: node beforeSelection: selectionInText step: blockForStep [
	| selectionInNode |
	
	node ifNil:[ ^selectionInText ].
	selectionInNode := node start to: node stop.
	^ (selectionInText = selectionInNode )
		ifTrue: [blockForStep value: selectionInText  value: node ]
		ifFalse: [selectionInNode ].
]

{
	#category : #'stand out',
	#timestamp : ' 8/31/2017 05:26:40'
}
NNavDirection class>>findSelectionFor: navigationContext [
	self subclassResponsibility .
]
