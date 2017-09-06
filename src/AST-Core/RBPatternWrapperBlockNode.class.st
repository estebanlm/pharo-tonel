"
RBPatternWrapperBlockNode allows further matching using a block after a node has been matched by a pattern node.

Instance Variables:
	wrappedNode	<RBProgramNode>	The original pattern node to match
"
Class {
	#name : #RBPatternWrapperBlockNode,
	#superclass : #RBPatternBlockNode,
	#instVars : [
		'wrappedNode'
	],
	#category : #AST-Core-Pattern,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternWrapperBlockNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitPatternWrapperBlockNode: self
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternWrapperBlockNode>>copyInContext: aDictionary  [
	"I don't know what this would mean, so ignore it."

	^ wrappedNode copyInContext: aDictionary
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternWrapperBlockNode>>match: aNode inContext: aDictionary  [
	(wrappedNode match: aNode inContext: aDictionary) ifFalse: [^false].
	^super match: aNode inContext: aDictionary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternWrapperBlockNode>>precedence [
	^1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternWrapperBlockNode>>wrappedNode [
	^wrappedNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternWrapperBlockNode>>wrappedNode: aRBProgramNode  [
	wrappedNode := aRBProgramNode.
	aRBProgramNode parent: self
]
