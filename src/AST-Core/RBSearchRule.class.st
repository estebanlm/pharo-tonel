"
RBSearchRule is a parse tree rule that simply searches for matches to the rule. Every time a match is found, answerBlock is evaluated with the node that matches and the cureent answer. This two-argument approach allows a collection to be formed from all of the matches (Think inject:into:).

Instance Variables:
	answerBlock	<BlockClosure>	Block to evaluate with the matching node and the current answer.


"
Class {
	#name : #RBSearchRule,
	#superclass : #RBParseTreeRule,
	#instVars : [
		'answerBlock'
	],
	#category : #AST-Core-Matching,
	#timestamp : 'md 8/9/2005 14:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSearchRule class>>searchFor: aString thenDo: aBlock  [
	^self new searchFor: aString thenDo: aBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSearchRule class>>searchForMethod: aString thenDo: aBlock  [
	^self new searchForMethod: aString thenDo: aBlock
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSearchRule class>>searchForTree: aBRProgramNode thenDo: aBlock  [
	^self new searchForTree: aBRProgramNode thenDo: aBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSearchRule>>canMatch: aProgramNode  [
	owner answer: (answerBlock value: aProgramNode value: owner answer).
	^true
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSearchRule>>searchFor: aString thenDo: aBlock  [
	self searchString: aString.
	answerBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSearchRule>>searchForMethod: aString thenDo: aBlock  [
	self methodSearchString: aString.
	answerBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSearchRule>>searchForTree: aBRProgramNode thenDo: aBlock  [
	searchTree := aBRProgramNode.
	answerBlock := aBlock
]
