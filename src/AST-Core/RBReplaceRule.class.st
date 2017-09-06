"
RBReplaceRule is the abstract superclass of all of the transforming rules. The rules change the source code by replacing the node that matches the rule. Subclasses implement different strategies for this replacement.

Subclasses must implement the following messages:
	matching
		foundMatchFor:

Instance Variables:
	verificationBlock	<BlockClosure>	Is evaluated with the matching node. This allows for further verification of a match beyond simple tree matching.


"
Class {
	#name : #RBReplaceRule,
	#superclass : #RBParseTreeRule,
	#instVars : [
		'verificationBlock'
	],
	#category : #AST-Core-Matching,
	#timestamp : 'md 8/9/2005 14:56'
}

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>canMatch: aProgramNode  [
	^verificationBlock value: aProgramNode
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>foundMatchFor: aProgramNode  [
	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>initialize [
	super initialize.
	verificationBlock := [:aNode | true]
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>replace: aProgramNode with: newNode  [
	aProgramNode replaceMethodSource: newNode
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>searchFor: searchString replaceWith: replaceString  [

	self subclassResponsibility
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>searchFor: searchString replaceWith: replaceString when: aBlock  [

	self subclassResponsibility
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>searchForMethod: searchString replaceWith: replaceString  [

	self subclassResponsibility
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>searchForMethod: searchString replaceWith: replaceString when: aBlock  [

	self subclassResponsibility
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>searchForTree: aBRProgramNode replaceWith: replaceNode  [

	self subclassResponsibility
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReplaceRule>>searchForTree: aBRProgramNode replaceWith: replaceString when: aBlock  [

	self subclassResponsibility
]
