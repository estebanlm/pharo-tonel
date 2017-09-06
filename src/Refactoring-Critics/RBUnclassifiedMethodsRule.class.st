"
All methods should be put into a protocol (method category) for better readability.
"
Class {
	#name : #RBUnclassifiedMethodsRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:20'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnclassifiedMethodsRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnclassifiedMethodsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UnclassifiedMethodsRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnclassifiedMethodsRule>>basicCheck: aMethod  [

	^ aMethod protocol = Protocol unclassified 
		
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnclassifiedMethodsRule>>checkMethod: aMethod  [

	(self basicCheck: aMethod ) 
		ifTrue: [ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnclassifiedMethodsRule>>group [
	^ 'Style'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnclassifiedMethodsRule>>name [
	^ 'Unclassified methods'
]
