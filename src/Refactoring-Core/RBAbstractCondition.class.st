"
I am the abstract base class of refactoring conditions.
Conditions are used by refactoring operation for checking preconditions before applying the 
refactoring.

I implement some common behavior for error handling - errorMacro.
And to combine conditions with boolean operatiosn (and/or/not).

Most of the condition checking behavior is implemented on my subclass 
RBCondition. 

Instances of RBConditions are created by factory methods on its class side.
"
Class {
	#name : #RBAbstractCondition,
	#superclass : #Object,
	#instVars : [
		'errorMacro'
	],
	#category : #Refactoring-Core-Conditions,
	#timestamp : 'NicolaiHess 5/19/2016 16:35'
}

{
	#category : #'logical operations',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>& aCondition  [
	^RBConjunctiveCondition new left: self right: aCondition
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>check [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>errorBlock [
	^self errorBlockFor: false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>errorBlockFor: aBoolean  [
	^nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>errorMacro [
	^errorMacro isNil
		ifTrue: ['unknown']
		ifFalse: [errorMacro]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>errorMacro: aString  [
	errorMacro := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>errorString [
	^self errorStringFor: false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>errorStringFor: aBoolean [
	^self errorMacro expandMacrosWith: aBoolean
]

{
	#category : #'logical operations',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>not [
	^RBNegationCondition on: self
]

{
	#category : #'logical operations',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractCondition>>| aCondition  [
	"(A | B) = (A not & B not) not"

	^(self not & aCondition not) not
]
