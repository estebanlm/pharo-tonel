"
Pharo code should not contain linefeed characters.
"
Class {
	#name : #RBMethodSourceContainsLinefeedsRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:52'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodSourceContainsLinefeedsRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodSourceContainsLinefeedsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'MethodSourceContainsLinefeedsRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodSourceContainsLinefeedsRule>>basicCheck: aMethod  [
	^ aMethod sourceCode includes: Character lf
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodSourceContainsLinefeedsRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: 
		[ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodSourceContainsLinefeedsRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodSourceContainsLinefeedsRule>>name [
	^ 'Method source contains linefeeds'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodSourceContainsLinefeedsRule>>severity [
	^ #error
]
