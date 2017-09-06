"
Checks code using the do: method instead of using the collect: or select: methods. This often occurs with new people writing code. The collect: and select: variants express the source code''s intentions better.
"
Class {
	#name : #RBCollectionProtocolRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:25'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionProtocolRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'CollectionProtocolRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionProtocolRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionProtocolRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'`@collection do: [:`each | | `@temps | `@.Statements1. `@object add: `@arg. `@.Statements2]'
			'`@collection do: [:`each | | `@temps | 
				`@.Statements1. 
				`@condition ifTrue: [| `@blockTemps | 
						`@.BlockStatements1. 
						`@object add: `each. 
						`@.BlockStatements2]. 
				`@.Statements2]'
			'`@collection do: [:`each | | `@temps | 
				`@.Statements1. 
				`@condition ifFalse: [| `@blockTemps | 
						`@.BlockStatements1. 
						`@object add: `each. 
						`@.BlockStatements2]. 
				`@.Statements2]' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionProtocolRule>>name [
	^ 'Uses do: instead of collect: or select:''s'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCollectionProtocolRule>>rationale [
	^ 'Checks for code using the do: method instead of using the collect: or select: methods.'
]
