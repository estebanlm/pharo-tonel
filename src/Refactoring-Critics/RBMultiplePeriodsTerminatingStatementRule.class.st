"
A rule to check for multiple periods terminating the same statement, which is unnecessary, probably unintentional, and can cause problems when porting to other platforms like GemStone.
"
Class {
	#name : #RBMultiplePeriodsTerminatingStatementRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'monty 8/15/2016 23:12'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiplePeriodsTerminatingStatementRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiplePeriodsTerminatingStatementRule class>>uniqueIdentifierName [

	^ 'MultiplePeriodsTerminatingStatementRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiplePeriodsTerminatingStatementRule>>basicCheck: aMethod [
	aMethod parseTree
		nodesDo: [ :each | 
			(each isSequence and: [ each periods size > each statements size ])
				ifTrue: [ ^ true ] ].
	^ false
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiplePeriodsTerminatingStatementRule>>checkMethod: aMethod [
	(self basicCheck: aMethod)
		ifTrue: [ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiplePeriodsTerminatingStatementRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiplePeriodsTerminatingStatementRule>>name [
	^ 'Multiple periods terminating the same statement'
]
