"
A TRBProgramNodeVisitor is a simple  that define visitor methods. 
"
Trait {
	#name : #TRBProgramNodeVisitor,
	#traits : '{}',
	#classTraits : '{}',
	#category : #AST-Core-Visitors,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitArgumentNode: anArgumentNode [
	"Sent *each time* an argument node is found"
	^ self visitVariableNode: anArgumentNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitArgumentNodes: aNodeCollection  [
	"Sent *once* when visiting method and block nodes"
	^aNodeCollection do: [ :each | self visitArgumentNode: each ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitArrayNode: anArrayNode  [

	anArrayNode children do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode variable.
	self visitNode: anAssignmentNode value
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitBlockNode: aBlockNode  [
	self visitArgumentNodes: aBlockNode arguments.
	self visitNode: aBlockNode body
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitCascadeNode: aCascadeNode  [
	aCascadeNode messages do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitGlobalNode: aSelfNode [
	^ self visitVariableNode: aSelfNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitInstanceVariableNode: aSelfNode [
	^ self visitVariableNode: aSelfNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitLiteralArrayNode: aRBLiteralArrayNode  [
	aRBLiteralArrayNode contents do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitLiteralNode: aLiteralNode [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitMessageNode: aMessageNode  [
	(aMessageNode isCascaded not or: [aMessageNode isFirstCascaded]) 
		ifTrue: [self visitNode: aMessageNode receiver].
	aMessageNode arguments do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitMethodNode: aMethodNode  [
	self visitArgumentNodes: aMethodNode arguments.
	aMethodNode pragmas
		do: [ :each | self visitNode: each ].
	self visitNode: aMethodNode body
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitNode: aNode  [
	^aNode acceptVisitor: self
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitParseErrorNode: anErrorNode [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitPatternBlockNode: aRBPatternBlockNode  [
	self visitArgumentNodes: aRBPatternBlockNode arguments.
	self visitNode: aRBPatternBlockNode body
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode  [
	self visitNode: aRBPatternWrapperBlockNode wrappedNode.
	self visitArgumentNodes: aRBPatternWrapperBlockNode arguments.
	self visitNode: aRBPatternWrapperBlockNode body
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitPragmaNode: aPragmaNode [
	aPragmaNode arguments do: [ :each | self visitNode: each ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitReturnNode: aReturnNode  [
	^ self visitNode: aReturnNode value
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitSelfNode: aSelfNode [
	^ self visitVariableNode: aSelfNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitSequenceNode: aSequenceNode  [
	self visitTemporaryNodes: aSequenceNode temporaries.
	aSequenceNode statements do: [:each | self visitNode: each]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitSuperNode: aSuperNode [
	^ self visitVariableNode: aSuperNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitTemporaryNode: aNode  [
	"Sent *each time* a temporary node is found"
	^ self visitVariableNode: aNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitTemporaryNodes: aNodeCollection  [
	"This is triggered when defining the temporaries between the pipes"
	^self visitArgumentNodes: aNodeCollection
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitThisContextNode: aThisContextNode [
	^ self visitVariableNode: aThisContextNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
TRBProgramNodeVisitor>>visitVariableNode: aVariableNode [
	^ aVariableNode
]
