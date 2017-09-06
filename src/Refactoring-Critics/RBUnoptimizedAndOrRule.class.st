"
Checks for inefficient nesting of logical conditions.
"
Class {
	#name : #RBUnoptimizedAndOrRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedAndOrRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UnoptimizedAndOrRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedAndOrRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedAndOrRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'(`@a and: `@b) and: `@c'
			'(`@a or: `@b) or: `@c' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedAndOrRule>>name [
	^ 'Uses "(a and: [b]) and: [c]" instead of "a and: [b and: [c]]"'
]
