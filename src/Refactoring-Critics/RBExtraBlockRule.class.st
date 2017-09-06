"
Check for blocks that are immediately evaluated. Since the block is immediately evaluated, there is no need for the statements to be in a block.
For example, [:x | 1 + x] value: 4 is equivalent to 1 + 4
"
Class {
	#name : #RBExtraBlockRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:34'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExtraBlockRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ExtraBlockRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExtraBlockRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExtraBlockRule>>initialize [
	super initialize.
	self matcher 
		matches: '`{:node | node isMessage and: [node receiver isBlock and: [node parent isCascade not and: [#(#value #value: #value:value: #value:value:value: #valueWithArguments:) includes: node selector]]]}'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExtraBlockRule>>name [
	^ 'Block immediately evaluated'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExtraBlockRule>>rationale [
	^ 'Check for blocks that are immediately evaluated.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExtraBlockRule>>severity [
	^ #information
]
