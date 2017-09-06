"
Checks for methods whose source sends a different super message.

A common example of this is in creation methods. You might define a method such as:

	createInstance
		^super new initialize

If the new method is not defined in the class, you should probably rewrite this to use self instead. Also, if the new method is defined, you might question why you need to send new to the superclass instead of to the class.
"
Class {
	#name : #RBSendsDifferentSuperRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:25'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsDifferentSuperRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsDifferentSuperRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SendsDifferentSuperRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsDifferentSuperRule>>basicCheck: aMethod  [

	^ aMethod superMessages anySatisfy: [ :message |
		message ~= aMethod selector ]
	

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsDifferentSuperRule>>checkMethod: aMethod  [
	| message |
	(message := (aMethod superMessages)
		detect: [ :each | each ~= aMethod selector ]
		ifNone: [ nil ]) notNil ifTrue: 
		[ result
			addSearchString: message;
			addMethod: aMethod ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsDifferentSuperRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsDifferentSuperRule>>name [
	^ 'Sends different super message'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSendsDifferentSuperRule>>rationale [
	^ 'Checks for methods whose source sends a different super message.'
]
