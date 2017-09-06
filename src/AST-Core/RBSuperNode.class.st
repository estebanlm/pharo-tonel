"
I am a specialized variable node for 'super'
"
Class {
	#name : #RBSuperNode,
	#superclass : #RBVariableNode,
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSuperNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitSuperNode: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSuperNode>>isSuper [
	^ true
]
