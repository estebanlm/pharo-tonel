"
I am a specialized variable node for instance variables.

Just like RBGlobalNode, RBInstanceVariableNodes are only used in a RBMethodNode after we do a semantic analyzing with a proper compilation context to deduce the class for which this variable is an instance variable.
"
Class {
	#name : #RBInstanceVariableNode,
	#superclass : #RBVariableNode,
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 14:35'
}

{
	#category : #visting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBInstanceVariableNode>>acceptVisitor: aProgramNodeVisitor  [
	^ aProgramNodeVisitor visitInstanceVariableNode: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBInstanceVariableNode>>isInstance [
	^true
]
