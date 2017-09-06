"
Checks for assignements to temporaries that are not used afterwards.
"
Class {
	#name : #RBUnnecessaryAssignmentRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnnecessaryAssignmentRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UnnecessaryAssignmentRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnnecessaryAssignmentRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnnecessaryAssignmentRule>>initialize [
	super initialize.
	self matcher 
		matches: '^`{:aNode | aNode isAssignment and: [(aNode whoDefines: aNode variable name) notNil]}'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnnecessaryAssignmentRule>>name [
	^ 'Unnecessary assignment to a temporary variable'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnnecessaryAssignmentRule>>severity [
	^ #information
]
