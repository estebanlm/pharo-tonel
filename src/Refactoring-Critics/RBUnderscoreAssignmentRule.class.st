"
Replace _ by :=
"
Class {
	#name : #RBUnderscoreAssignmentRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 18:49'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnderscoreAssignmentRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UnderscoreAssignmentRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnderscoreAssignmentRule>>group [
	^ 'Style'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnderscoreAssignmentRule>>initialize [
	super initialize.
	self rewriteRule 
		replace: '`var := ``@object' with: '`var := ``@object'
		when: [ :node | node assignmentOperator = '_' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnderscoreAssignmentRule>>name [
	^ 'Underscore assignements should be avoided'
]
