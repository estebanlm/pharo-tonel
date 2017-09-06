"
RBProgramNodeVisitor is an abstract visitor for the RBProgramNodes.


"
Class {
	#name : #RBProgramNodeVisitor,
	#superclass : #Object,
	#category : #AST-Core-Visitors,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitArgumentNode: anArgumentNode [
	"Sent *each time* an argument node is found"
	^ self visitVariableNode: anArgumentNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitArgumentNodes: aNodeCollection  [
	"Sent *once* when visiting method and block nodes"
	^aNodeCollection do: [ :each | self visitArgumentNode: each ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitArrayNode: anArrayNode  [

	anArrayNode children do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode variable.
	self visitNode: anAssignmentNode value
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitBlockNode: aBlockNode  [
	self visitArgumentNodes: aBlockNode arguments.
	self visitNode: aBlockNode body
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitCascadeNode: aCascadeNode  [
	aCascadeNode messages do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitGlobalNode: aSelfNode [
	^ self visitVariableNode: aSelfNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitInstanceVariableNode: aSelfNode [
	^ self visitVariableNode: aSelfNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitLiteralArrayNode: aRBLiteralArrayNode  [
	aRBLiteralArrayNode contents do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitLiteralNode: aLiteralNode [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitMessageNode: aMessageNode  [
	(aMessageNode isCascaded not or: [aMessageNode isFirstCascaded]) 
		ifTrue: [self visitNode: aMessageNode receiver].
	aMessageNode arguments do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitMethodNode: aMethodNode  [
	self visitArgumentNodes: aMethodNode arguments.
	aMethodNode pragmas
		do: [ :each | self visitNode: each ].
	self visitNode: aMethodNode body
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitNode: aNode  [
	^aNode acceptVisitor: self
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitParseErrorNode: anErrorNode [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitPatternBlockNode: aRBPatternBlockNode  [
	self visitArgumentNodes: aRBPatternBlockNode arguments.
	self visitNode: aRBPatternBlockNode body
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode  [
	self visitNode: aRBPatternWrapperBlockNode wrappedNode.
	self visitArgumentNodes: aRBPatternWrapperBlockNode arguments.
	self visitNode: aRBPatternWrapperBlockNode body
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitPragmaNode: aPragmaNode [
	aPragmaNode arguments do: [ :each | self visitNode: each ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitReturnNode: aReturnNode  [
	^ self visitNode: aReturnNode value
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitSelfNode: aSelfNode [
	^ self visitVariableNode: aSelfNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitSequenceNode: aSequenceNode  [
	self visitTemporaryNodes: aSequenceNode temporaries.
	aSequenceNode statements do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitSuperNode: aSuperNode [
	^ self visitVariableNode: aSuperNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitTemporaryNode: aNode  [
	"Sent *each time* a temporary node is found"
	^ self visitVariableNode: aNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitTemporaryNodes: aNodeCollection  [
	"This is triggered when defining the temporaries between the pipes"
	^self visitArgumentNodes: aNodeCollection
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitThisContextNode: aThisContextNode [
	^ self visitVariableNode: aThisContextNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBProgramNodeVisitor>>visitVariableNode: aVariableNode [
	^ aVariableNode
]
