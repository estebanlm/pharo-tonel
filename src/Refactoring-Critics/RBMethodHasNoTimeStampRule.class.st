"
For proper versioning, every method should have a timestamp.
"
Class {
	#name : #RBMethodHasNoTimeStampRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:53'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodHasNoTimeStampRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodHasNoTimeStampRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'MethodHasNoTimeStampRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodHasNoTimeStampRule>>basicCheck: aMethod  [
	^ aMethod timeStamp isEmpty
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodHasNoTimeStampRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: 
		[ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodHasNoTimeStampRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodHasNoTimeStampRule>>name [
	^ 'Method has no timeStamp'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodHasNoTimeStampRule>>severity [
	^ #error
]
