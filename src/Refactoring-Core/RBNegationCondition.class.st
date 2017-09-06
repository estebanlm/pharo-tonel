"
I am a refactoring condition representing a boolean NOT of another condition.

I am created by sending the message #not to another condition.

Checking this conditions holds true, if my condition is false. 

"
Class {
	#name : #RBNegationCondition,
	#superclass : #RBAbstractCondition,
	#instVars : [
		'condition'
	],
	#category : #Refactoring-Core-Conditions,
	#timestamp : 'NicolaiHess 5/19/2016 16:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBNegationCondition class>>on: aCondition [
	^self new condition: aCondition
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBNegationCondition>>check [
	^condition check not
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBNegationCondition>>condition: aCondition  [
	condition := aCondition.
	self errorMacro: condition errorMacro
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBNegationCondition>>errorBlockFor: aBoolean  [
	^condition errorBlockFor: aBoolean not
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBNegationCondition>>errorStringFor: aBoolean  [
	^condition errorStringFor: aBoolean not
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBNegationCondition>>printOn: aStream  [
	aStream nextPutAll: 'NOT ';
		print: condition
]
