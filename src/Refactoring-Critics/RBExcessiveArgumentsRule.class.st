"
This smell arises when a method contains a long number of argument (five or more), which can indicate that a new object should be created to wrap the numerous parameters. The defined number of arguments can be edited in RBExcessiveArgumentsRule>>argumentsCount.

If the arguments are used in multiple methods this is a clear indication for the creation of an object representing the context in which the computation should occur. 
	
The defined number of arguments can be edited in #argumentsCount.
"
Class {
	#name : #RBExcessiveArgumentsRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:09'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveArgumentsRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveArgumentsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ExcessiveArgumentsRule'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveArgumentsRule>>argumentsCount [
	^ 5
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveArgumentsRule>>basicCheck: aMethod  [
	^ aMethod numArgs >= self argumentsCount
		
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveArgumentsRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod)
		ifTrue: [ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveArgumentsRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveArgumentsRule>>name [
	^ 'Excessive number of arguments'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveArgumentsRule>>rationale [
	^ 'Long argument lists (five or more) can indicate that a new object should be created to wrap the numerous parameters.'
]
