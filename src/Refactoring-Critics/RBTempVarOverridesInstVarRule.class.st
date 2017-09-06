"
Finds methods whose temporary variables override an instance variable. This causes problems if you want to use the instance variable inside the method.
"
Class {
	#name : #RBTempVarOverridesInstVarRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'matcher',
		'varName',
		'vars'
	],
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:21'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempVarOverridesInstVarRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempVarOverridesInstVarRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'TempVarOverridesInstVarRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempVarOverridesInstVarRule>>basicCheck: aMethod  [
	vars := aMethod methodClass instVarNames.
	^ (matcher 
		executeTree: aMethod ast
		initialAnswer: false)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempVarOverridesInstVarRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: 
		[ result 
			addMethod: aMethod;
		 	addSearchString: varName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempVarOverridesInstVarRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempVarOverridesInstVarRule>>initialize [
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher
		matchesArgument: '`var'
		do: [ :aNode :answer | 
			answer or: [
				varName := aNode name.
				vars includes: varName ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempVarOverridesInstVarRule>>name [
	^ 'Instance variable overridden by temporary variable'
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempVarOverridesInstVarRule>>postCopy [
	super postCopy.
	self initialize.
]
