"
A FinderExampleClassNode is a node used by the FinderUI's tree representing the Class for the method deduced
from an examples (by MethodFinder)
"
Class {
	#name : #FinderExampleClassNode,
	#superclass : #FinderClassNode,
	#category : #Tool-Finder,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderExampleClassNode>>displayString [
	(self parentNode receiver isKindOf: self item)
		ifTrue: [ ^ '*' , super displayString ].
	^ super displayString
]
