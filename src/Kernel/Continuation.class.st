"
I permit to save the execution flow and to restart it later. I was originally used in seaside.

Example :

You have an object with the instance variable executionFlow.

You save the current execution flow with :
Continuation currentDo: [ :cc | executionFlow := cc]

You restart the execution flow with :
executionFlow value: true



"
Class {
	#name : #Continuation,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#category : #Kernel-Methods,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation class>>current [
	^ self fromContext: thisContext sender
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation class>>currentDo: aBlock [
	^ aBlock value: (self fromContext: thisContext sender)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation class>>fromContext: aStack [
	^self new initializeFromContext: aStack
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation>>initializeFromContext: aContext [
	| valueStream context |
	valueStream := WriteStream on: (Array new: 20).
	context := aContext.
	[context notNil] whileTrue:
		[valueStream nextPut: context.
		1 to: context class instSize do: [:i | valueStream nextPut: (context instVarAt: i)].
		1 to: context size do: [:i | valueStream nextPut: (context at: i)].
		context := context sender].
	values := valueStream contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation>>numArgs [
	^ 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation>>restoreValues [
	| valueStream context |
	valueStream := values readStream.
	[valueStream atEnd] whileFalse:
		[context := valueStream next.
		1 to: context class instSize do: [:i | context instVarAt: i put: valueStream next].
		1 to: context size do: [:i | context at: i put: valueStream next]]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation>>terminate: aContext [
	| context |
	context := aContext.
	[context notNil] whileTrue: [context := context swapSender: nil]
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation>>value [
	self value: nil
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation>>value: anObject [
	"Invoke the continuation and answer anObject as return value."

	self terminate: thisContext.
	self restoreValues.
	thisContext swapSender: values first.
	^ anObject
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:33'
}
Continuation>>valueWithArguments: anArray [
	anArray size = 1
		ifFalse: [ ^ self error: 'continuations can only be resumed with one argument' ].
	self value: anArray first
]
