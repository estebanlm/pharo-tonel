"
I represent the specialized variable named 'thisContext'
"
Class {
	#name : #RBThisContextNode,
	#superclass : #RBVariableNode,
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBThisContextNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitThisContextNode: self
]
