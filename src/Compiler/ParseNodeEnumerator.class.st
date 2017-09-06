"
ParseNodeEnumerator implements ParseNode>>nodesDo:.  It can be used to enumerate an entire tree via
	aParseNode accept: (ParseNodeEnumerator ofBlock: aBlock)
or selectively, excluding the node and subnodes for which selectBlock answers false, via
	aParseNode accept: (ParseNodeEnumerator
							ofBlock: aBlock
							select: selectBlock)

Here's a doIt that generates and compiles the visiting methods:

self superclass selectors do:
	[:s|
	self compile: (String streamContents:
		[:str| | arg |
		arg := 'a', (s allButFirst: 5) allButLast.
		str nextPutAll: s, ' ', arg; crtab;
			nextPutAll: '(theSelectBlock isNil or: [theSelectBlock value: '; nextPutAll: arg; nextPutAll: ']) ifFalse:'; crtab;
			tab: 2; nextPutAll: '[^nil].'; crtab;
			nextPutAll: 'theBlock value: '; nextPutAll: arg; nextPut: $.; crtab;
			nextPutAll: '^super '; nextPutAll: s, ' ', arg])]
"
Class {
	#name : #ParseNodeEnumerator,
	#superclass : #ParseNodeVisitor,
	#instVars : [
		'theBlock',
		'theSelectBlock'
	],
	#category : #Compiler-Support,
	#timestamp : 'eem 8/31/2010 11:41'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator class>>ofBlock: aBlock [
	^self new ofBlock: aBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator class>>ofBlock: aBlock select: selectBlock [
	^self new ofBlock: aBlock select: selectBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>ofBlock: aBlock [
	theBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>ofBlock: aBlock select: aSelectBlock [
	theBlock := aBlock.
	theSelectBlock := aSelectBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>shouldVisit: aNode [
	^theSelectBlock isNil or: [theSelectBlock value: aNode]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitAssignmentNode: anAssignmentNode [
	(theSelectBlock isNil or: [theSelectBlock value: anAssignmentNode]) ifFalse:
		[^nil].
	theBlock value: anAssignmentNode.
	^super visitAssignmentNode: anAssignmentNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitBlockNode: aBlockNode [
	(theSelectBlock isNil or: [theSelectBlock value: aBlockNode]) ifFalse:
		[^nil].
	theBlock value: aBlockNode.
	^super visitBlockNode: aBlockNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitBraceNode: aBraceNode [
	(theSelectBlock isNil or: [theSelectBlock value: aBraceNode]) ifFalse:
		[^nil].
	theBlock value: aBraceNode.
	^super visitBraceNode: aBraceNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitCascadeNode: aCascadeNode [
	(theSelectBlock isNil or: [theSelectBlock value: aCascadeNode]) ifFalse:
		[^nil].
	theBlock value: aCascadeNode.
	^super visitCascadeNode: aCascadeNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitCommentNode: aCommentNode [
	(theSelectBlock isNil or: [theSelectBlock value: aCommentNode]) ifFalse:
		[^nil].
	theBlock value: aCommentNode.
	^super visitCommentNode: aCommentNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitFieldNode: aFieldNode [
	(theSelectBlock isNil or: [theSelectBlock value: aFieldNode]) ifFalse:
		[^nil].
	theBlock value: aFieldNode.
	^super visitFieldNode: aFieldNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitFutureNode: aFutureNode [
	(theSelectBlock isNil or: [theSelectBlock value: aFutureNode]) ifFalse:
		[^nil].
	theBlock value: aFutureNode.
	^super visitFutureNode: aFutureNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitInstanceVariableNode: anInstanceVariableNode [
	
	(self shouldVisit: anInstanceVariableNode) ifFalse:
		[^nil].
	theBlock value: anInstanceVariableNode.
	^super visitInstanceVariableNode: anInstanceVariableNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitLiteralNode: aLiteralNode [
	(theSelectBlock isNil or: [theSelectBlock value: aLiteralNode]) ifFalse:
		[^nil].
	theBlock value: aLiteralNode.
	^super visitLiteralNode: aLiteralNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitLiteralVariableNode: aLiteralVariableNode [
	(theSelectBlock isNil or: [theSelectBlock value: aLiteralVariableNode]) ifFalse:
		[^nil].
	theBlock value: aLiteralVariableNode.
	^super visitLiteralVariableNode: aLiteralVariableNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitMessageNode: aMessageNode [
	(theSelectBlock isNil or: [theSelectBlock value: aMessageNode]) ifFalse:
		[^nil].
	theBlock value: aMessageNode.
	^super visitMessageNode: aMessageNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitMessageNodeInCascade: aMessageNodeInCascade [
	(theSelectBlock isNil or: [theSelectBlock value: aMessageNodeInCascade]) ifFalse:
		[^nil].
	theBlock value: aMessageNodeInCascade.
	^super visitMessageNodeInCascade: aMessageNodeInCascade
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitMethodNode: aMethodNode [
	(theSelectBlock isNil or: [theSelectBlock value: aMethodNode]) ifFalse:
		[^nil].
	theBlock value: aMethodNode.
	^super visitMethodNode: aMethodNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitNewArrayNode: aNewArrayNode [
	(theSelectBlock isNil or: [theSelectBlock value: aNewArrayNode]) ifFalse:
		[^nil].
	theBlock value: aNewArrayNode.
	^super visitNewArrayNode: aNewArrayNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitRemoteTempVectorNode: aRemoteTempVectorNode [
	(theSelectBlock isNil or: [theSelectBlock value: aRemoteTempVectorNode]) ifFalse:
		[^nil].
	theBlock value: aRemoteTempVectorNode.
	^super visitRemoteTempVectorNode: aRemoteTempVectorNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitReturnNode: aReturnNode [
	(theSelectBlock isNil or: [theSelectBlock value: aReturnNode]) ifFalse:
		[^nil].
	theBlock value: aReturnNode.
	^super visitReturnNode: aReturnNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitSelectorNode: aSelectorNode [
	(theSelectBlock isNil or: [theSelectBlock value: aSelectorNode]) ifFalse:
		[^nil].
	theBlock value: aSelectorNode.
	^super visitSelectorNode: aSelectorNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitTempVariableNode: aTempVariableNode [
	(theSelectBlock isNil or: [theSelectBlock value: aTempVariableNode]) ifFalse:
		[^nil].
	theBlock value: aTempVariableNode.
	^super visitTempVariableNode: aTempVariableNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseNodeEnumerator>>visitVariableNode: aVariableNode [
	(theSelectBlock isNil or: [theSelectBlock value: aVariableNode]) ifFalse:
		[^nil].
	theBlock value: aVariableNode.
	^super visitVariableNode: aVariableNode
]
