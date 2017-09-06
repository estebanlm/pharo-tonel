"
Checks for messages that are sent but not implemented by a global. Reported methods will certainly cause a doesNotUnderstand: message when they are executed.
"
Class {
	#name : #RBSendsUnknownMessageToGlobalRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 23:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsUnknownMessageToGlobalRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SendsUnknownMessageToGlobalRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsUnknownMessageToGlobalRule>>group [
	^ 'Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsUnknownMessageToGlobalRule>>initialize [
	super initialize.
	self matcher 
		matches: '`{:node :context | node isVariable and: [ Smalltalk includesKey: node name asSymbol ] } `@message: `@args'
		do: [ :node :answer | 
			answer isNil 
				ifTrue: [
					| what |
					what := Smalltalk globals at: node receiver name asSymbol.
					(what notNil and: [ (what respondsTo: node selector) not ]) 
						ifTrue: [ node ]
						ifFalse: [ nil ] ]
				ifFalse: [ answer ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsUnknownMessageToGlobalRule>>name [
	^ 'Sends unknown message to global'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsUnknownMessageToGlobalRule>>severity [
	^ #error
]
