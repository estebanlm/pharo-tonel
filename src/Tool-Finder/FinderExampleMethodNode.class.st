"
A FinderExampleMethodNode is a node used by the FinderUI's tree representing a Method deduced
from an examples (by MethodFinder)
"
Class {
	#name : #FinderExampleMethodNode,
	#superclass : #FinderMethodNode,
	#category : #Tool-Finder,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderExampleMethodNode>>childNodeClassFromItem: anItem [
	"I answer the class of my children nodes (if I have some)"

	^ FinderExampleClassNode
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderExampleMethodNode>>receiver [
	| index rec |
	index := self item findString: self selector.
	rec := self item copyFrom: 1 to: index - 1.
	^ Smalltalk compiler evaluate: rec
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderExampleMethodNode>>selector [
	^ self model finder findSelector: self item
]
