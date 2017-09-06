"
This smell arises when a method just forwards the message to its superclass. This often happens due to code changes or when you simply forget that you wanted to extend the behavior of a superclass method. These methods can be removed.
"
Class {
	#name : #RBJustSendsSuperRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'matcher'
	],
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:57'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'JustSendsSuperRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule>>basicCheck: aMethod  [
	^ (aMethod ast isPrimitive not and: 
		[ matcher 
			executeMethod: aMethod ast
			initialAnswer: false ])
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: 
		[ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule>>initialize [
	super initialize.
	matcher := RBParseTreeSearcher justSendsSuper
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule>>name [
	^ 'Method just sends super message'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule>>rationale [
	^ 'Check for methods that just forward the message to its superclass.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBJustSendsSuperRule>>severity [
	^ #information
]
