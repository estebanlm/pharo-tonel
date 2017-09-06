"
A RBParseTreeLintRule is a rule that is expressed using a parse tree matcher on a method AST.
"
Class {
	#name : #RBParseTreeLintRule,
	#superclass : #RBBasicLintRule,
	#instVars : [
		'matcher'
	],
	#category : #Refactoring-Critics,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule class>>checksMethod [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule class>>isVisible [
	^ self name ~= #RBParseTreeLintRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ParseTreeLintRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule>>basicCheck: aMethod  [
	(self matcher canMatchMethod: aMethod) 
		ifFalse: [ ^ false ].
	^ (self matcher executeTree: aMethod ast initialAnswer: nil) isNotNil
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: [ result addMethod: aMethod ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule>>initialize [
	super initialize.
	matcher := RBParseTreeSearcher new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule>>matcher [
	^ matcher
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule>>resetResult [
	super resetResult.
	self result matcher: self matcher
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeLintRule>>resultClass [
	^ RBParseTreeEnvironment
]
