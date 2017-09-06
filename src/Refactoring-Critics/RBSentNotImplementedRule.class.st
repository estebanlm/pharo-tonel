"
This smell arises when a message is sent by a method,  but no class in the system implements such a message. This method sent will certainly cause a doesNotUnderstand: message when they are executed.
"
Class {
	#name : #RBSentNotImplementedRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'NicolaiHess 8/31/2015 16:07'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSentNotImplementedRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSentNotImplementedRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SentNotImplementedRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSentNotImplementedRule>>basicCheck: aMethod [
	^ aMethod messages anySatisfy: [ :each | each isSelectorSymbol not ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSentNotImplementedRule>>checkMethod: aMethod [
	| messages |
	messages := aMethod messages reject: [ :each | each isSelectorSymbol].
	messages do: [ :m | result
					   addSearchString: m;
						addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSentNotImplementedRule>>group [
	^ 'Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSentNotImplementedRule>>name [
	^ 'Messages sent but not implemented'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSentNotImplementedRule>>rationale [
	^ 'Checks for messages that are sent by a method, but no class in the system implements such a message. Reported methods will certainly cause a doesNotUnderstand: message when they are executed.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSentNotImplementedRule>>severity [
	^ #error
]
