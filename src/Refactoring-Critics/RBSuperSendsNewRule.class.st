"
This rule checks for method that wrongly initialize an object twice. Contrary to other Smalltalk implementations Pharo automatically calls #initiailize on object creation.
A warning is raised when the statement self new initialize is found in a method.
"
Class {
	#name : #RBSuperSendsNewRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'matcher'
	],
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:22'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SuperSendsNewRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule>>basicCheck: aMethod  [
	aMethod methodClass isMeta ifTrue: [ ^ false ].
	^ (matcher executeTree: aMethod ast initialAnswer: false) 
		
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) 
		ifTrue: [ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule>>group [
	^ 'Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule>>initialize [
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matchesAnyOf: #(
			'super new initialize'
			'(super new: `@expr) initialize'
			'self new initialize'
			'(self new: `@expr) initialize' )
		do: [ :answer :node | true ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule>>longDescription  [
	^' This rule checks for method that wrongly initialize an object twice. Contrary to other Smalltalk implementations Pharo automatically calls #initiailize on object creation.
For example, a warning is raised when the statment self new initialize is found in a method.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule>>name [
	^ 'Sends super new initialize'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSuperSendsNewRule>>rationale [
	^ 'Checks for methods that wrongly initialize an object twice. Contrary to other Smalltalk implementations Pharo automatically calls #initiailize on object creation.'
]
