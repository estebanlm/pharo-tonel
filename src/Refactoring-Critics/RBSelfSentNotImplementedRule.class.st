"
This smell arises when a message is sent to self by a method,  but no class in the superclass chain implements such a message. This method sent will certainly cause a doesNotUnderstand: message when they are executed.
"
Class {
	#name : #RBSelfSentNotImplementedRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'MarcusDenker 2/25/2016 16:04'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSelfSentNotImplementedRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSelfSentNotImplementedRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SelfSentNotImplementedRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSelfSentNotImplementedRule>>basicCheck: aMethod [
	| message |
	aMethod methodClass isTrait ifTrue: [ ^false ].
	message := aMethod superMessages
		detect: [ :each | aMethod methodClass superclass isNil or: [ (aMethod methodClass superclass canUnderstand: each) not ] ]
		ifNone: [ aMethod selfMessages detect: [ :each | (aMethod methodClass allSelectors includes: each) not ] ifNone: [ nil ] ].
	^ message notNil
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSelfSentNotImplementedRule>>checkMethod: aMethod [
	| message |
	aMethod methodClass isTrait ifTrue: [ ^self].
	message := aMethod superMessages
		detect: [ :each | aMethod methodClass superclass isNil or: [ (aMethod methodClass superclass canUnderstand: each) not ] ]
		ifNone: [ aMethod selfMessages detect: [ :each | (aMethod methodClass allSelectors includes: each) not ] ifNone: [ nil ] ].
	message ifNotNil: [ result
				addSearchString: message;
				addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSelfSentNotImplementedRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSelfSentNotImplementedRule>>name [
	^ 'Super and Self Messages sent but not implemented'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSelfSentNotImplementedRule>>rationale [
	^ 'Checks if messages sent to self or super exist in the hierarchy, since these can be statically typed. Reported methods will certainly cause a doesNotUnderstand: message when they are executed.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSelfSentNotImplementedRule>>severity [
	^ #error
]
