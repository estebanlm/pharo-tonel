"
Checks for code using equality tests instead of the message sends. Since the code ""aCollection size = 0"" works for all objects, it is more difficult for someone reading such code to determine that ""aCollection"" is a collection. Whereas, if you say ""aCollection isEmpty"" then aCollection must be a collection since isEmpty is only defined for collections.
"
Class {
	#name : #RBConsistencyCheckRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:26'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBConsistencyCheckRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ConsistencyCheckRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBConsistencyCheckRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBConsistencyCheckRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'`@object size == 0'
			'`@object size = 0'
			'`@object size > 0'
			'`@object size >= 1'
			'`@collection at: `@collection size' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBConsistencyCheckRule>>name [
	^ 'Uses "size = 0" instead of "isEmpty"'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBConsistencyCheckRule>>rationale [
	^ 'Checks for code using equality tests instead of the message sends.'
]
