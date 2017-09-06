"
Checks for ifTrue: or ifFalse: conditions at end of methods that have two or more statements inside their blocks. Such code might better represent the true meaning of the code if they returned self instead.
"
Class {
	#name : #RBGuardingClauseRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBGuardingClauseRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'GuardingClauseRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBGuardingClauseRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBGuardingClauseRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyMethodOf: #(
			'`@MethodName: `@args 
				| `@temps | 
				`@.Statements. 
				`@condition ifTrue: [| `@BlockTemps | `.Statement1. `.Statement2. `@.BStatements]' 
			'`@MethodName: `@args 
				| `@temps | 
				`@.Statements. 
				`@condition ifFalse: [| `@BlockTemps | `.Statement1. `.Statement2. `@.BStatements]' )
		do: [ :node :answer | 
			answer isNil 
				ifTrue: [ node body statements last ]
				ifFalse: [ answer ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBGuardingClauseRule>>name [
	^ 'Guarding clauses'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBGuardingClauseRule>>rationale [
	^ 'Checks for ifTrue: or ifFalse: conditions at end of methods that have two or more statements inside their blocks. Such code might better represent the true meaning of the code if they returned self instead.'
]
