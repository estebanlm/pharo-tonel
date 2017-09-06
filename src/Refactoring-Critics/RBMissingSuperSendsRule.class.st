"
Checks that methods that should always contain a super message send, actually contain a super message send. For example, the postCopy method should always contain a ""super postCopy"". The list of methods that should contain super message sends is in #superMessages.
"
Class {
	#name : #RBMissingSuperSendsRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:51'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingSuperSendsRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingSuperSendsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'MissingSuperSendsRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingSuperSendsRule>>basicCheck: aMethod  [
	| definer superMethod |
	(aMethod methodClass isMeta not and: [ self superMessages includes: aMethod selector ]) ifTrue: 
		[ definer := aMethod methodClass superclass ifNotNil: [ :sc | sc whichClassIncludesSelector: aMethod selector ].
		definer ifNotNil: 
			[ "super defines same method"
			(aMethod superMessages includes: aMethod selector) ifFalse: 
				[ "but I don't call it"
				superMethod := definer 
					compiledMethodAt: aMethod selector
					ifAbsent: [  ].
				^ (superMethod isReturnSelf or: [ superMethod sendsSelector: #subclassResponsibility ]) not ] ]].
	
	^ false
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingSuperSendsRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: 
		[ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingSuperSendsRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingSuperSendsRule>>name [
	^ 'Missing super sends in selected methods.'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMissingSuperSendsRule>>superMessages [
	^#(#release #postCopy #postBuildWith: #preBuildWith: #postOpenWith: #noticeOfWindowClose: #initialize)
]
