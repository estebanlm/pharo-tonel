"
Checks for users of to:do: when the shorter collect: would work.
"
Class {
	#name : #RBToDoCollectRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:58'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoCollectRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ToDoCollectRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoCollectRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoCollectRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'| `@temps1 |
			`@.Stmts1.
			`collection := Array new: `@size.
			`@.Stmts2.
			1 to: `@size do: 
					[:`i | 
					| `@Btemps2 | 
					`@.BStmts1. 
					`collection at: `i put: `@obj.
					`@.BStmt2].
			`@.Stmts3'
				'| `@temps1 |
			`@.Stmts1.
			`collection := Array new: `@size.
			`@.Stmts2.
			1 to: `collection size do: 
					[:`i | 
					| `@Btemps2 | 
					`@.BStmts1. 
					`collection at: `i put: `@obj.
					`@.BStmt2].
			`@.Stmts3' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoCollectRule>>name [
	^ 'to:do: used instead of collect:'
]
