"
See my #longDescription .
"
Class {
	#name : #RBRemoveAssignmentWithoutEffectRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRemoveAssignmentWithoutEffectRule class>>uniqueIdentifierName [

	^ 'RemoveAssignmentWithoutEffectRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRemoveAssignmentWithoutEffectRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRemoveAssignmentWithoutEffectRule>>initialize [
	super initialize.
 
	self rewriteRule
		replace: 	'`var := `var' with: ''
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRemoveAssignmentWithoutEffectRule>>longDescription  [
	^ 'Remove assignment has no effect. For example, var := var is unless'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRemoveAssignmentWithoutEffectRule>>name [
	^ 'Remove assignment has no effect'
]
