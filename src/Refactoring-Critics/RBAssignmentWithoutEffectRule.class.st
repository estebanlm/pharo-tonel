"
This smell arises when a statement such as x := x is found. This statement has not effect, it can be removed.
"
Class {
	#name : #RBAssignmentWithoutEffectRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentWithoutEffectRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'AssignmentWithoutEffectRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentWithoutEffectRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentWithoutEffectRule>>initialize [
	super initialize.
	self matcher 
		matches: '`var := `var'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentWithoutEffectRule>>name [
	^ 'Assignment has no effect'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentWithoutEffectRule>>rationale [
	^ 'A statement such as x := x has no effect.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentWithoutEffectRule>>severity [
	^ #information
]
