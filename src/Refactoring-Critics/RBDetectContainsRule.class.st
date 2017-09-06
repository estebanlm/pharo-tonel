"
Checks for bytecodePrimEqual  using the do: method instead of using the contains: or detect: methods.
"
Class {
	#name : #RBDetectContainsRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:27'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectContainsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'DetectContainsRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectContainsRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectContainsRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'`@collection do: [:`each | | `@temps | 
				`@.Statements1. 
				`@condition ifFalse: [| `@BlockTemps | `@.BlockStatements1. ^`each]. 
				`@.Statements2]'
			'`@collection do: [:`each | | `@temps | 
				`@.Statements1. 
				`@condition ifTrue: [| `@BlockTemps | `@.BlockStatements1.  ^`each]. 
				`@.Statements2]'
			'`@collection do: [:`each | | `@temps | 
				`@.Statements1. 
				`@condition ifFalse: [| `@BlockTemps | `@.BlockStatements1. ^true]. 
				`@.Statements2]'
			'`@Collection do: [:`each | | `@temps | 
				`@.Statements1. 
				`@condition ifTrue: [| `@BlockTemps | `@.BlockStatements1.  ^true]. 
				`@.Statements2]'
			'`@collection do: [:`each | | `@temps | 
				`@.Statements1. 
				`@condition ifFalse: [| `@BlockTemps | `@.BlockStatements1. ^false]. 
				`@.Statements2]'
			'`@collection do: [:`each | | `@temps | 
				`@.Statements1. 
				`@condition ifTrue: [| `@BlockTemps | `@.BlockStatements1.  ^false]. 
				`@.Statements2]' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectContainsRule>>name [
	^ 'Uses do: instead of contains: or detect:''s'
]
