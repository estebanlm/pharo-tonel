"
Checks for senders of typical collection enumeration methods that return an unused result.

For example, check that the result of a select: or detect: is used.
"
Class {
	#name : #RBCollectSelectNotUsedRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:23'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectSelectNotUsedRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'CollectSelectNotUsedRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectSelectNotUsedRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectSelectNotUsedRule>>initialize [
	super initialize.
	self matcher 
		matches: '`{:node | node isMessage and: [(#(#select: #collect: #reject:) includes: node selector) and: [node isUsed not]]}'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectSelectNotUsedRule>>name [
	^ 'Doesn''t use the result of a collect:/select:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectSelectNotUsedRule>>rationale [
	^ 'Checks for senders of typical collection enumeration methods that return an unused result.'
]
