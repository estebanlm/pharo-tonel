"
RBStringReplaceRule replaces a matched tree with another tree (which may include metavariable from the matching tree). This is a very succint syntax for specifying most rewrites.

Instance Variables:
	replaceTree	<RBProgramNode>	The tree to replace the matched tree with.


"
Class {
	#name : #RBStringReplaceRule,
	#superclass : #RBReplaceRule,
	#instVars : [
		'replaceTree'
	],
	#category : #AST-Core-Matching,
	#timestamp : 'md 8/9/2005 14:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule class>>searchFor: searchString replaceWith: replaceString  [
	^self new searchFor: searchString replaceWith: replaceString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule class>>searchFor: searchString replaceWith: replaceString when: aBlock  [
	^self new 
		searchFor: searchString
		replaceWith: replaceString
		when: aBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule class>>searchForMethod: searchString replaceWith: replaceString  [
	^(self new)
		searchForMethod: searchString replaceWith: replaceString;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule class>>searchForMethod: searchString replaceWith: replaceString when: aBlock  [
	^self new 
		searchForMethod: searchString
		replaceWith: replaceString
		when: aBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule class>>searchForTree: aRBProgramNode replaceWith: replaceString  [
	^self new searchForTree: aRBProgramNode replaceWith: replaceString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule class>>searchForTree: aRBProgramNode replaceWith: replaceString when: aBlock  [
	^self new 
		searchForTree: aRBProgramNode
		replaceWith: replaceString
		when: aBlock
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>foundMatchFor: aProgramNode  [
	| newNode |
	newNode := replaceTree copyInContext: self context.
	aProgramNode replaceMethodSource: newNode.
	newNode copyCommentsFrom: aProgramNode.
	^newNode
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>methodReplaceString: replaceString  [
	replaceTree := RBParser parseRewriteMethod: replaceString
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>replaceString: replaceString  [
	replaceTree := RBParser parseRewriteExpression: replaceString.
	searchTree isSequence = replaceTree isSequence 
		ifFalse: 
			[searchTree isSequence 
				ifTrue: [replaceTree := RBSequenceNode statements: (Array with: replaceTree)]
				ifFalse: [searchTree := RBSequenceNode statements: (Array with: searchTree)]]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>searchFor: searchString replaceWith: replaceString  [
	self searchString: searchString.
	self replaceString: replaceString
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>searchFor: searchString replaceWith: replaceString when: aBlock  [
	self searchFor: searchString replaceWith: replaceString.
	verificationBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>searchForMethod: searchString replaceWith: replaceString  [
	self methodSearchString: searchString.
	self methodReplaceString: replaceString
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>searchForMethod: searchString replaceWith: replaceString when: aBlock  [
	self searchForMethod: searchString replaceWith: replaceString.
	verificationBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>searchForTree: aBRProgramNode replaceWith: replaceNode  [
	searchTree := aBRProgramNode.
	replaceTree := replaceNode
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplaceRule>>searchForTree: aBRProgramNode replaceWith: replaceString when: aBlock  [
	self searchForTree: aBRProgramNode replaceWith: replaceString.
	verificationBlock := aBlock
]
