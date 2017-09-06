"
Moving assignments outside blocks leads to shorter and more efficient code.
For example:
test 
	ifTrue: [var := 1]
	ifFalse: [var:= 2]
is equivalent to:
var :=  test 
	ifTrue: [1]
	ifFalse: [2]
"
Class {
	#name : #RBAssignmentInIfTrueRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'BernardoContreras 7/22/2015 20:18'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentInIfTrueRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'AssignmentInIfTrueRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentInIfTrueRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentInIfTrueRule>>initialize [
	super initialize.
	self rewriteRule
		replace: '``@Boolean ifTrue: [`variable := ``@true] ifFalse: [`variable := ``@false]'
		with: '`variable := ``@Boolean ifTrue: [``@true] ifFalse: [``@false]';
		replace: '``@Boolean ifFalse: [`variable := ``@true] ifTrue: [`variable := ``@false]'
		with: '`variable := ``@Boolean ifFalse: [``@true] ifTrue: [``@false]'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentInIfTrueRule>>name [
	^ 'Move variable assignment outside of single statement ifTrue:ifFalse: blocks'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentInIfTrueRule>>rationale [
	^ 'Moving assignments outside blocks leads to shorter and more efficient code.'
]
