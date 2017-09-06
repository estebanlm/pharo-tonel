"
Checks for literal arrays that contain the #, symbol. The user may have thought that it was a separator.
"
Class {
	#name : #RBLiteralArrayContainsCommaRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:57'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayContainsCommaRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayContainsCommaRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'LiteralArrayContainsCommaRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayContainsCommaRule>>basicCheck: aMethod  [
	^ aMethod allLiterals anySatisfy: [ :each | self doesLiteralArrayContainComma: each ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayContainsCommaRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) 
		ifTrue: [ result addMethod: aMethod ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayContainsCommaRule>>doesLiteralArrayContainComma: aLiteral  [
	aLiteral class = Array 
		ifFalse: [ ^ false ].
	(aLiteral includes: #,)
		ifTrue: [ ^ true ].
	^ aLiteral 
		anySatisfy: [ :each | self doesLiteralArrayContainComma: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayContainsCommaRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayContainsCommaRule>>name [
	^ 'Literal array contains a #,'
]
