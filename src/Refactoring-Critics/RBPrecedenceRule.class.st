"
Checks for mathematical expressions that might be evaluated different (from left-to-right) than the developer thinks.
"
Class {
	#name : #RBPrecedenceRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 23:06'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPrecedenceRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'PrecedenceRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPrecedenceRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPrecedenceRule>>initialize [
	super initialize.
	self matcher 
		matches: '`{:node | node isMessage and: [node hasParentheses not and: [#(#+ #-) includes: node selector]]} * `@C'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPrecedenceRule>>name [
	^ 'Inspect instances of "A + B * C" might be "A + (B * C)"'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBPrecedenceRule>>rationale [
	^ 'Checks for mathematical expressions that might be evaluated different (from left-to-right) than the developer thinks.'
]
