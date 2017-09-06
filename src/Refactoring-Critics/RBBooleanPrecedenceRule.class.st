"
Checks precedence ordering of & and | with equality operators. Since | and & have the same precedence as =, there are common mistakes where parenthesis are missing around the equality operators.
"
Class {
	#name : #RBBooleanPrecedenceRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBooleanPrecedenceRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'BooleanPrecedenceRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBooleanPrecedenceRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBooleanPrecedenceRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'`@object1 | `@object2 = `@object3'
			'`@object1 | `@object2 == `@object3'
			'`@object1 & `@object2 = `@object3'
			'`@object1 & `@object2 == `@object3'
			'`@object1 | `@object2 ~= `@object3'
			'`@object1 | `@object2 ~~ `@object3'
			'`@object1 & `@object2 ~= `@object3'
			'`@object1 & `@object2 ~~ `@object3' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBooleanPrecedenceRule>>name [
	^ 'Uses A | B = C instead of A | (B = C)'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBBooleanPrecedenceRule>>severity [
	^ #error
]
