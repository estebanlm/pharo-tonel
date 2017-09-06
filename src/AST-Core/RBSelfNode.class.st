"
I am a specialized version for the 'self'
"
Class {
	#name : #RBSelfNode,
	#superclass : #RBVariableNode,
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSelfNode>>acceptVisitor: aProgramNodeVisitor  [
	^ aProgramNodeVisitor visitSelfNode: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSelfNode>>isSelf [
	^ true
]
