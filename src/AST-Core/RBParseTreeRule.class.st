"
RBParseTreeRule is the abstract superclass of all of the parse tree searching rules. A parse tree rule is the first class representation of a particular rule to search for. The owner of a rule is the algorithm that actually executes the search. This arrangement allows multiple searches to be conducted by a single Searcher.

Instance Variables:
	owner	<ParseTreeSearcher>	The searcher that is actually performing the search.
	searchTree	<RBProgramNode>	The parse tree to be searched.


"
Class {
	#name : #RBParseTreeRule,
	#superclass : #Object,
	#instVars : [
		'searchTree',
		'owner'
	],
	#category : #AST-Core-Matching,
	#timestamp : 'md 8/9/2005 14:55'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule class>>methodSearch: aString  [
	^(self new)
		methodSearchString: aString;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule class>>search: aString  [
	^(self new)
		searchString: aString;
		yourself
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule>>canMatch: aProgramNode  [
	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule>>context [
	^owner context
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule>>foundMatchFor: aProgramNode [
	^aProgramNode
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule>>methodSearchString: aString  [
	searchTree := RBParser parseRewriteMethod: aString
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule>>owner: aParseTreeSearcher [
	owner := aParseTreeSearcher
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule>>performOn: aProgramNode  [
	self context empty.
	^((searchTree match: aProgramNode inContext: self context) 
		and: [self canMatch: aProgramNode]) 
			ifTrue:
				[owner recusivelySearchInContext.
				self foundMatchFor: aProgramNode]
			ifFalse: [nil]
			
		
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule>>searchString: aString  [
	searchTree := RBParser parseRewriteExpression: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeRule>>sentMessages [
	^searchTree sentMessages
]
