"
Check for assignments on block arguments.
For example:

[:x :y|
	x:= x+y.
	]

The block argument ""x"" should not be written. This is considered bad style. And some compiler may reject that code.
"
Class {
	#name : #RBAssignmentOnBlockArgumentRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:15'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentOnBlockArgumentRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentOnBlockArgumentRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"

	^ 'AssignmentOnBlockArgumentRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentOnBlockArgumentRule>>basicCheck: aMethod [
	^ (RBFindBlockArgumentAssignment collectAssignments: aMethod ast) notEmpty 
		
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentOnBlockArgumentRule>>checkMethod: aMethod [
	(RBFindBlockArgumentAssignment collectAssignments: aMethod ast)
		do: [ :item | 
			result addMethod: aMethod.
			result addSearchString: item ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentOnBlockArgumentRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentOnBlockArgumentRule>>name [
	^ 'Assignments on block arguments'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAssignmentOnBlockArgumentRule>>rationale [
	^ 'Check for assignments on block arguments.
For example:

[:x :y|
	x:= x+y.
	]

The block argument "x" should not be written'
]
