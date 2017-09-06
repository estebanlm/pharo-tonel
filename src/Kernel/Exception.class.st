"
This is the main class used to implement the exception handling system (EHS).  It plays two distinct roles:  that of the exception, and that of the exception handler.  More specifically, it implements the bulk of the protocols laid out in the ANSI specification - those protocol names are reflected in the message categories.

Exception is an abstract class.  Instances should neither be created nor trapped.  In most cases, subclasses should inherit from Error or Notification rather than directly from Exception.

Exceptions have an optional #messageText that can be set when they are signaled.
Exceptions also have the concept of #signaler, the object that is the subject of the exception.
This will be set automatically (to the #receiver), but can be set when the exception is signaled. 

In implementing this EHS, The Fourth Estate Inc. incorporated some ideas and code from Craig Latta's EHS.  His insights were crucial in allowing us to implement Context>>valueUninterruptably (and by extension, #ensure: and #ifCurtailed:), and we imported the following methods with little or no modification:

Context>>terminateTo:
Context>>terminate
Context>>receiver:
Context>>answer:

Thanks, Craig!
"
Class {
	#name : #Exception,
	#superclass : #Object,
	#instVars : [
		'messageText',
		'tag',
		'signaler',
		'signalContext',
		'handlerContext',
		'outerContext'
	],
	#category : #Kernel-Exceptions,
	#timestamp : 'MarcusDenker 6/9/2014 16:43'
}

{
	#category : #exceptionselector,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception class>>, anotherException [
	"Create an exception set containing the receiver and anotherException"

	^ ExceptionSet new
		add: self;
		add: anotherException;
		yourself
]

{
	#category : #exceptionselector,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception class>>- anotherException [
	"Create an exception set containing the receiver 
	and anotherException as exclusion."

	^ ExceptionSetWithExclusions new
		add: self;
		addExclusion: anotherException;
		yourself
]

{
	#category : #exceptionselector,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception class>>handles: exception [
	"Determine whether an exception handler will accept a signaled exception."

	^ exception isKindOf: self
]

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception class>>signal [
	"Signal the occurrence of an exceptional condition."

	^ self new signal
]

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception class>>signal: message [
	"Signal the occurrence of an exceptional condition with a specified textual description."

	^ self new signal: message
]

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception class>>signal: message in: context [
	"Signal the occurrence of an exceptional condition with a specified textual description in the given context."

	^ self new 
		messageText: message;
		signalIn: context
]

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception class>>signalIn: context [
	"Signal the occurrence of an exceptional condition in the given context."

	^ self new signalIn: context
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>debug [
	"open a debugger on myself"
	Processor activeProcess 
		debug: self signalerContext
		title: self description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>defaultAction [
	"The default action taken if the exception is signaled."

	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>defaultResumeValue [
	"Answer the value that by default should be returned if the exception is resumed"
	
	^ nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>defaultReturnValue [
	"Answer the value that by default should be returned if the exception is returned"
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>description [
	"Return a textual description of the exception."

	^ String streamContents: [ :stream | | mt |
		stream << self class name.
		(mt := self messageText) isEmptyOrNil
			ifFalse: [ stream << ': ' << mt ] ]
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>freeze [
	"freeze the context stack to keep the exception usable outside the catch blocks"

	self freezeUpTo: thisContext
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>freezeUpTo:  aContext [
	"freeze the signal context up to the given context so the exception is usable outside the catch block"
	signalContext := signalContext copyTo: aContext
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>isNested [
	"Determine whether the current exception handler is within the scope of another handler for the same exception."

	^ handlerContext nextHandlerContext canHandleSignal: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>isResumable [
	"Determine whether an exception is resumable."

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>messageText [
	"Return an exception's message text."

	^ messageText ifNil: [ String empty ]
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>messageText: signalerText [
	"Set an exception's message text."

	messageText := signalerText
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>outer [
	"Evaluate the enclosing exception action and return to here instead of signal if it resumes (see #resumeUnchecked:)."

	| prevOuterContext |
	self isResumable 
		ifTrue: [
			prevOuterContext := outerContext.
			outerContext := thisContext contextTag ].
	self pass.

]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>pass [
	"Yield control to the enclosing exception action for the receiver."

	handlerContext nextHandlerContext handleSignal: self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>printOn: stream [

	stream nextPutAll: self description
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>privHandlerContext [

	^handlerContext
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>privHandlerContext: aContextTag [

	handlerContext := aContextTag
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>receiver [
	^ self signalerContext receiver
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>resignalAs: replacementException [
	"Signal an alternative exception in place of the receiver."
	^ replacementException signalIn: signalContext
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>resume [
	"Return from the message that signaled the receiver."

	self resume: self defaultResumeValue
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>resume: resumptionValue [
	"Return resumptionValue as the value of the signal message."

	self isResumable ifFalse: [ IllegalResumeAttempt signal ].
	self resumeUnchecked: resumptionValue
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>resumeUnchecked: resumptionValue [
	"Return resumptionValue as the value of #signal, unless this was called after an #outer message, then return resumptionValue as the value of #outer."

	| ctxt |
	outerContext 
		ifNil: [
			signalContext return: resumptionValue ] 
		ifNotNil: [
			ctxt := outerContext.
			outerContext := ctxt tempAt: 1. "prevOuterContext in #outer"
			ctxt return: resumptionValue ]

]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>retry [
	"Abort an exception handler and re-evaluate its protected block."

	handlerContext restart
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>retryUsing: alternativeBlock [
	"Abort an exception handler and evaluate a new block in place of the handler's protected block."

	handlerContext restartWithNewReceiver: alternativeBlock

]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>return [
	"Return nil as the value of the block protected by the active exception handler."

	self return: self defaultReturnValue
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>return: returnValue [
	"Return the argument as the value of the block protected by the active exception handler."

	handlerContext return: returnValue
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>searchFrom: aContext [
	" Set the context where the handler search will start. "

	signalContext := aContext contextTag
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>signal [
	"Ask ContextHandlers in the sender chain to handle this signal.  The default is to execute and return my defaultAction."

	signalContext := thisContext contextTag.
	signaler ifNil: [ signaler := self receiver ].
	^ signalContext nextHandlerContext handleSignal: self
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>signal: signalerText [
	"Signal the occurrence of an exceptional condition with a specified textual description."

	self messageText: signalerText.
	^ self signal
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>signalIn: context [
	"Ask ContextHandlers in the sender chain starting at the given context to handle this signal. 
	The default is to execute and return my defaultAction."

	signalContext := context.
	signaler ifNil: [ signaler := self receiver ].
	^ signalContext nextHandlerContext handleSignal: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>signaler [
	"Return the object that is the subject involving me.
	This is set automatically to my #receiver during #signal
	but could be overwritten when I am signaled"

	^ signaler
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>signaler: anObject [
	"Set the object that is the subject involving me.
	This is set automatically to my #receiver during #signal
	but could be overwritten when I am signaled"

	signaler := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>signalerContext [
	"Find the first sender of signal(:), the first context which is neither for an instance method nor for a class side method of Exception (or subclass).
	This will make sure that the same context is found for both, `Error signal` and `Error new signal`"

	^ signalContext findContextSuchThat: [ :context |
		(context receiver == self 
		or: [ context receiver == self class ]) not ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>tag [
	"Return an exception's tag value."

	^ tag 
		ifNil: [ self messageText ]
		ifNotNil: [ tag ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Exception>>tag: t [
	"This message is not specified in the ANSI protocol, but that looks like an oversight because #tag is specified, and the spec states that the signaler may store the tag value."

	tag := t
]
