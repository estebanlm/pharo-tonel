"
I am a specific variable node for method and block arguments.

Parsing a method or block code will just use RBVariableNodes for block/method arguments, until we call doSemanticAnalysis on the method node.
"
Class {
	#name : #RBArgumentNode,
	#superclass : #RBVariableNode,
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 14:40'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArgumentNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitArgumentNode: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArgumentNode>>adaptToSemanticNode [
	" I can't provide more semantics "
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArgumentNode>>isArgument [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArgumentNode>>isBlockVar [
	"true if a variable node is defined by a block node"

	^ (self whoDefines: self name) isBlock
]
