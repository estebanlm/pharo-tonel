"
Check for methods sending the yourself message when it is not necessary.
"
Class {
	#name : #RBYourselfNotUsedRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:21'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBYourselfNotUsedRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'YourselfNotUsedRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBYourselfNotUsedRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBYourselfNotUsedRule>>initialize [
	super initialize.
	self matcher 
		matches: '`{:node | node parent isUsed not} yourself'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBYourselfNotUsedRule>>name [
	^ 'Doesn''t use the result of a yourself message'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBYourselfNotUsedRule>>rationale [
	^ 'Check for methods sending the yourself message when it is not necessary.'
]
