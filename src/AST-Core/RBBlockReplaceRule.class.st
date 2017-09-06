"
RBBlockReplaceRule replaces the matching node by the result of evaluating replaceBlock. This allows arbitrary computation to come up with a replacement.

Instance Variables:
	replaceBlock	<BlockClosure>	The block that returns the node to replace to matching node with.

"
Class {
	#name : #RBBlockReplaceRule,
	#superclass : #RBReplaceRule,
	#instVars : [
		'replaceBlock'
	],
	#category : #AST-Core-Matching,
	#timestamp : 'md 8/9/2005 14:55'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule class>>searchFor: searchString replaceWith: replaceBlock  [
	^self new searchFor: searchString replaceWith: replaceBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule class>>searchFor: searchString replaceWith: replaceBlock when: aBlock  [
	^self new 
		searchFor: searchString
		replaceWith: replaceBlock
		when: aBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule class>>searchForMethod: searchString replaceWith: replaceBlock  [
	^self new searchForMethod: searchString replaceWith: replaceBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule class>>searchForMethod: searchString replaceWith: replaceBlock when: aBlock  [
	^self new 
		searchForMethod: searchString
		replaceWith: replaceBlock
		when: aBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule class>>searchForTree: aRBProgramNode replaceWith: replaceBlock  [
	^self new searchForTree: aRBProgramNode replaceWith: replaceBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule class>>searchForTree: aRBProgramNode replaceWith: replaceBlock when: aBlock  [
	^self new 
		searchForTree: aRBProgramNode
		replaceWith: replaceBlock
		when: aBlock
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule>>foundMatchFor: aProgramNode  [
	| newNode |
	newNode := replaceBlock value: aProgramNode.
	aProgramNode replaceMethodSource: newNode.
	^newNode
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule>>initialize [
	super initialize.
	replaceBlock := [:aNode | aNode]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule>>searchFor: searchString replaceWith: aBlock  [
	self searchString: searchString.
	replaceBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule>>searchFor: searchString replaceWith: replBlock when: verifyBlock  [
	self searchFor: searchString replaceWith: replBlock.
	verificationBlock := verifyBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule>>searchForMethod: searchString replaceWith: aBlock  [
	self methodSearchString: searchString.
	replaceBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule>>searchForMethod: searchString replaceWith: replBlock when: verifyBlock  [
	self searchForMethod: searchString replaceWith: replBlock.
	verificationBlock := verifyBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule>>searchForTree: aBRProgramNode replaceWith: aBlock  [
	searchTree := aBRProgramNode.
	replaceBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockReplaceRule>>searchForTree: aBRProgramNode replaceWith: replBlock when: verifyBlock  [
	self searchForTree: aBRProgramNode replaceWith: replBlock.
	verificationBlock := verifyBlock
]
