"
Checks for users of to:do: that also increment or decrement a counter.
In Pharo you do not increment or decrement counter but should use the message to:do:by:.

1 to: 100 by: 3 do: [ :each | ... ]
"
Class {
	#name : #RBToDoWithIncrementRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:57'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoWithIncrementRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ToDoWithIncrementRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoWithIncrementRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoWithIncrementRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'`@i to: `@j do: [:`e | | `@temps | `@.Stmts. `x := `x + 1. `@.Stmts2]'
			'`@i to: `@j by: `@k do: [:`e | | `@temps | `@.Stmts. `x := `x + `@k. `@.Stmts2]' 
			'`@i to: `@j do: [:`e | | `@temps | `@.Stmts. `x := `x - 1. `@.Stmts2]'
			'`@i to: `@j by: `@k do: [:`e | | `@temps | `@.Stmts. `x := `x - `@k. `@.Stmts2]')
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoWithIncrementRule>>name [
	^ 'to:do: loop also increments a counter'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBToDoWithIncrementRule>>rationale [
	^ 'Checks for users of to:do: that also increment or decrement a counter.'
]
