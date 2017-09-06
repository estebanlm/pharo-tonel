"
I am a refactoring condition combining two other conditions by a boolean AND.

I am created by sending the binary message #& to another condition (left) with another condition (right) as its argument.

Checking this conditions holds true, if my left and my right condition is true. 
"
Class {
	#name : #RBConjunctiveCondition,
	#superclass : #RBAbstractCondition,
	#instVars : [
		'left',
		'right',
		'failed'
	],
	#category : #Refactoring-Core-Conditions,
	#timestamp : 'NicolaiHess 5/19/2016 16:40'
}

{
	#category : #checking,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>check [
	left check
		ifFalse: 
			[failed := #leftFailed.
			^false].
	right check
		ifFalse: 
			[failed := #rightFailed.
			^false].
	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>errorBlockFor: aBoolean  [
	^aBoolean
		ifTrue: [nil]
		ifFalse: 
			[failed = #leftFailed ifTrue: [left errorBlock] ifFalse: [right errorBlock]]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>errorMacro [
	^errorMacro isNil
		ifTrue: [self longMacro]
		ifFalse: [super errorMacro]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>errorStringFor: aBoolean  [
	^aBoolean
		ifTrue: [self neitherFailed]
		ifFalse: [self perform: failed]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>left: aCondition right: aCondition2  [
	left := aCondition.
	right := aCondition2.
	failed := #unknownFailed
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>leftFailed [
	^left errorStringFor: false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>longMacro [
	^'(' , left errorMacro , ') <1?AND:OR> (' , right errorMacro , ')'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>neitherFailed [
	^(left errorStringFor: true) , ' AND ' , (right errorStringFor: true)
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>printOn: aStream  [
	aStream nextPutAll: left asString;
		nextPutAll: ' & ';
		nextPutAll: right asString

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>rightFailed [
	^right errorStringFor: false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBConjunctiveCondition>>unknownFailed [
	^(left errorStringFor: false) , ' OR ' , (right errorStringFor: false)
]
