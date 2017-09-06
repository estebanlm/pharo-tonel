"
Sometimes instance variables are used instead of method arguments or temporaries. You can check if an instance variable's value is always valid during the complete lifetime of an object. In addition, looking at methods used together by a group of methods may be an indication that a new object should be created. Large classes often exhibit a large number of instance variables. Some people also confuse classes and namespaces. 

The defined number of instance variables can be edited in #variablesCount.
"
Class {
	#name : #RBExcessiveVariablesRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:07'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ExcessiveVariablesRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule>>basicCheck: aClass [
	^ (aClass instVarNames size >= self variablesCount
		or: [ aClass classVarNames size >= self variablesCount ])
			
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule>>checkClass: aClass [
	(self basicCheck: aClass)
			ifTrue: [ result addClass: aClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule>>name [
	^ 'Excessive number of variables'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule>>rationale [
	^ 'Classes that have too many instance variables (10+) could be redesigned to have fewer fields, possibly through some nested object grouping.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule>>resultClass [
	^ RBClassEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExcessiveVariablesRule>>variablesCount [
	^ 10
]
