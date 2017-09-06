"
Floating point types are imprecise. Using the operators = or ~= might not yield the expected result due to internal rounding differences.
"
Class {
	#name : #RBFloatEqualityComparisonRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBFloatEqualityComparisonRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'FloatEqualityComparisonRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBFloatEqualityComparisonRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBFloatEqualityComparisonRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'`{ :node | node isLiteralNode and: [ node value isFloat ] } = `@expr'
			'`{ :node | node isLiteralNode and: [ node value isFloat ] } ~= `@expr'
			'`@expr = `{ :node | node isLiteralNode and: [ node value isFloat ] }'
			'`@expr ~= `{ :node | node isLiteralNode and: [ node value isFloat ] }' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBFloatEqualityComparisonRule>>name [
	^ 'Float equality comparison'
]
