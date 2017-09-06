"
Check for possible uses of the result returned by an add: or addAll: messages. These messages return their arguments not the receiver. As a result, may uses of the results are wrong.
"
Class {
	#name : #RBUsesAddRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:52'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesAddRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UsesAddRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesAddRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesAddRule>>initialize [
	super initialize.
	self matcher 
		matches: '`{:node | node isMessage and: [(node selector == #add: or: [node selector == #addAll:]) and: [node isDirectlyUsed]]}'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesAddRule>>name [
	^ 'Uses the result of an add: message'
]
