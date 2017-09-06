"
Checks for users of whileTrue: when the shorter to:do: would work.

For example
 
statements1. 
[index <= stop] 
	whileTrue: 
	[ 
	blockStmts1. 
	index := index + 1].
statements2
"
Class {
	#name : #RBWhileTrueRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBWhileTrueRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'WhileTrueRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBWhileTrueRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBWhileTrueRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'| `@temps | 
			`@.Statements1. 
			[`index <= `@stop] 
				whileTrue: 
					[| `@blockTemps | 
					`@.BlockStmts1. 
					`index := `index + 1].
			`@.Statements2'
			'| `@temps | 
			`@.Statements1. 
			[`index < `@stop] 
				whileTrue: 
					[| `@blockTemps | 
					`@.BlockStmts1. 
					`index := `index + 1].
			`@.Statements2'
			'| `@temps | 
			`@.Statements1. 
			[`index >= `@stop] 
				whileTrue: 
					[| `@blockTemps | 
					`@.BlockStmts1. 
					`index := `index - 1].
			`@.Statements2'
			'| `@temps | 
			`@.Statements1. 
			[`index > `@stop] 
				whileTrue: 
					[| `@blockTemps | 
					`@.BlockStmts1. 
					`index := `index - 1].
			`@.Statements2' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBWhileTrueRule>>name [
	^ 'Uses whileTrue: instead of to:do:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBWhileTrueRule>>rationale [
	^ 'Checks for users of whileTrue: when the shorter to:do: would work.'
]
