"
Checks that all temporaries are assigned before they are used. This can help find possible paths through the code where a variable might be unassigned when it is used.
"
Class {
	#name : #RBTempsReadBeforeWrittenRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:20'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempsReadBeforeWrittenRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempsReadBeforeWrittenRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'TempsReadBeforeWrittenRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempsReadBeforeWrittenRule>>basicCheck: aMethod  [
	| a |
	a asString.
	a := 1.
	^ (RBReadBeforeWrittenTester variablesReadBeforeWrittenIn: aMethod ast) notEmpty 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempsReadBeforeWrittenRule>>checkMethod: aMethod  [
	(RBReadBeforeWrittenTester variablesReadBeforeWrittenIn: aMethod ast) do: 
		[ :each | 
		result 
			addMethod: aMethod;
			addSearchString: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempsReadBeforeWrittenRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTempsReadBeforeWrittenRule>>name [
	^ 'Temporaries read before written'
]
