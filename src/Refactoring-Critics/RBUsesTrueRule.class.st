"
Checks for uses of the classes True and False instead of the objects true and false.

true is the object true, while True is the class whose true is the sole instance.
"
Class {
	#name : #RBUsesTrueRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'trueBinding',
		'falseBinding'
	],
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:14'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UsesTrueRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule>>basicCheck: aMethod  [
	^ (aMethod refersToLiteral: trueBinding) or: [ aMethod refersToLiteral: falseBinding ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: 
		[ result
			addMethod: aMethod;
			searchStrings: #('True' 'False' ) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule>>group [
	^ 'Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule>>initialize [
	super initialize.
	trueBinding := Smalltalk globals associationAt: #True.
	falseBinding := Smalltalk globals associationAt: #False
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule>>name [
	^ 'Uses True/False instead of true/false'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule>>rationale [
	^ 'Checks for uses of the classes True and False instead of the objects true and false.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUsesTrueRule>>severity [
	^ #error
]
