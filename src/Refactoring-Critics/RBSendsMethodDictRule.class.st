"
Nobody should directly access the method dictionary. It is purely an implementation artefact that we use one dictionary and it might change in the future.
"
Class {
	#name : #RBSendsMethodDictRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:24'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsMethodDictRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsMethodDictRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'NobodyShouldSendMethodDict'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsMethodDictRule>>basicCheck: aMethod [
	({Behavior. ClassDescription. Class.TBehavior . TClassDescription . TApplyingOnClassSide } includes: aMethod methodClass)
		ifTrue: [ ^ false ].
	^ (aMethod messages includes: #methodDict)
		
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsMethodDictRule>>checkMethod: aMethod [
	
	(self basicCheck: aMethod)
		ifTrue: [ 
			result
				addMethod: aMethod;
				addSearchString: 'methodDict' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsMethodDictRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsMethodDictRule>>name [
	^ 'No direct access of methodDict'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsMethodDictRule>>rationale [
	^ 'nobody should directly access the method dictionary. It is purely an implementation artefact that we use one dictionary and it might change in the future'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsMethodDictRule>>severity [
	^ #error
]
