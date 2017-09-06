"
A critique which know which node should be replaced by another one. This critiques are used first of all in rewrite rules.
"
Class {
	#name : #ReReplaceNodeCritique,
	#superclass : #ReAbstractCritique,
	#instVars : [
		'oldNode',
		'newNode'
	],
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 7/7/2016 09:21'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReplaceNodeCritique class>>rule: aRule achor: anAnchor oldNode: aNode newNode: anotherNode [

	^ self basicNew 
		initializeRule: aRule
		sourceAnchor: anAnchor
		oldNode: aNode
		newNode: anotherNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReplaceNodeCritique>>change [
	"creates new AST by replacing the node. Then the 'add method' change is generated from new AST"

	| newTree newTreeNode |
	newTree := sourceAnchor entity parseTree.
	newTreeNode := newTree nodeAtTraversalIndex: (
		oldNode methodNode traversalIndexOf: oldNode).
	self assert: newTreeNode = oldNode.

	newTreeNode replaceMethodSource: newNode.
	newTreeNode becomeForward: newNode.
	^ RBAddMethodChange
		compile: newTree methodNode newSource
		in: sourceAnchor entity methodClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReplaceNodeCritique>>initializeRule: aRule sourceAnchor: anAnchor oldNode: aNode newNode: anotherNode [

	self initializeRule: aRule sourceAnchor: anAnchor.
	oldNode := aNode.
	newNode := anotherNode 

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReReplaceNodeCritique>>providesChange [

	^ sourceAnchor entity isCompiledMethod
]
