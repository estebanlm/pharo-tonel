"
Checks for return statements within ensure: blocks that can have unintended side-effects.
"
Class {
	#name : #RBReturnInEnsureRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 23:06'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBReturnInEnsureRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ReturnInEnsureRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBReturnInEnsureRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBReturnInEnsureRule>>initialize [
	| returnMatcher |
	super initialize.
	returnMatcher := RBParseTreeSearcher new.
	returnMatcher 
		matches: '^ `@object'
		do: [ :node :answer | true ].
	self matcher 
		matchesAnyOf: #(
			'``@rcv ensure: [| `@temps | ``@.Stmts]'
			'``@rcv ifCurtailed: [| `@temps | ``@.Stmts]')
		do: [ :node :answer | 
			answer isNil 
				ifTrue: [
					(returnMatcher executeTree: node arguments first initialAnswer: false) 
						ifTrue: [ node ]
						ifFalse: [ nil ] ]
				ifFalse: [ answer ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBReturnInEnsureRule>>name [
	^ 'Contains a return in an ensure: block'
]
