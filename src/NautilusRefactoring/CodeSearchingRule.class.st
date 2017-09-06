"
A CodeSearchingRule is rule using a RBParseTreeSearcher
for the search.

use #matcher: for setting the parse tree searcher.

"
Class {
	#name : #CodeSearchingRule,
	#superclass : #RBParseTreeLintRule,
	#category : #NautilusRefactoring,
	#timestamp : 'NicolaiHess 11/30/2014 22:27'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
CodeSearchingRule class>>isVisible [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
CodeSearchingRule class>>uniqueIdentifierName [
	
	^ 'CodeSearchingRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
CodeSearchingRule>>matcher: aRule [

	matcher := aRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
CodeSearchingRule>>name [

	^ 'Code Searching'
]
