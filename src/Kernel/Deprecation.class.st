"
This Warning is signalled by methods which are deprecated.

Idiom: Imagine I want to deprecate the message #foo.

foo
	^ 'foo'

I can replace it with:

foo
	self 
		deprecated:   'The method #foo was not good. Use Bar>>newFoo instead.'
		on:  'here add date'
		in:  'here add version'
		 transformWith:   '`@receiver foo' -> '`@receiver newFoo'.	
	^self newFoo
	
	
The  transformWith:  part is optional. It allows to transform the deprecated method automatically when called.
If the transformation is defined, the Warning will not signalled.


"
Class {
	#name : #Deprecation,
	#superclass : #Warning,
	#instVars : [
		'context',
		'explanationString',
		'deprecationDate',
		'versionString',
		'rule'
	],
	#classVars : [
		'Log',
		'RaiseWarning',
		'ShowWarning'
	],
	#category : #Kernel-Exceptions,
	#timestamp : 'md 8/11/2016 16:28'
}

{
	#category : #logging,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation class>>deprecationsWhile: aBlock [
	"returns a log of all deprecated methods seen while executing aBlock"
	| oldLog result |
	oldLog := Log.
	Log := Set new.
	aBlock value.
	result := Log.
	oldLog ifNotNil: [oldLog addAll: result].
	Log := oldLog.
	^result
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation class>>initialize [
	Log := nil "#deprecationsWhile: logs all deprecations here"
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation class>>raiseWarning [
	"If true, then a dialog is popup for each deprecated method invocation"
	^ RaiseWarning ifNil: [RaiseWarning := true]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation class>>raiseWarning: aBoolean [
	RaiseWarning := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation class>>showWarning [
	"If true, then a message is send to the Transcript for each deprecated method invocation"
	^ ShowWarning ifNil: [ShowWarning := true]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation class>>showWarning: aBoolean [
	ShowWarning := aBoolean
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>= anObject [
	^self class == anObject class
	  and: [context = anObject context
	  and: [context
			ifNil: [explanationString = anObject explanationString]
			ifNotNil: [true]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>context: aContext [
	context := aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>contextOfDeprecatedMethod [
	^context
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>contextOfSender [
	^context sender
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>date: aDate [
	deprecationDate := aDate
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>defaultAction [
	Log 
		ifNotNil: [:log | log add: self].
	self logTranscript.
	self raiseWarning 
		ifTrue: [super defaultAction]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>deprecatedMethodName [
	^self contextOfDeprecatedMethod method printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>deprecationDate [

	^ deprecationDate ifNil: [ 'unknown' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>explanation: aString [
	explanationString := aString 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>explanationString [

	^ explanationString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>hash [
	^(context ifNil: [explanationString]) hash
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>logTranscript [
	self showWarning 
		ifTrue: [Transcript nextPutAll: self messageText; cr; flush].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>messageText [
	"Return an exception's message text."

	^ 'The method ', self deprecatedMethodName, ' called from ', self sendingMethodName ,' has been deprecated.
', explanationString
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>raiseWarning [
	^ self class raiseWarning
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>rewriterClass [
	^ self class environment at: #RBParseTreeRewriter ifAbsent: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>rule: aRule [
	rule := aRule
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>sendingMethodName [
	^self contextOfSender method printString
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>showWarning [
	^ self class showWarning
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>transform [
	| node rewriteRule aMethod |
	self raiseWarning ifFalse: [ ^ self ]. "when desprecations are disables, we do not want to transform, either"
	self rewriterClass ifNil:[ ^ self signal ].
	aMethod := self contextOfSender method.
	aMethod isDoIt ifTrue:[^ self]. "no need to transform doits"
	node := self contextOfSender sourceNodeExecuted.
	rewriteRule := self rewriterClass new 
		replace: rule key with: rule value.
	(rewriteRule executeTree: node)
		ifFalse: [ ^ self ].
	node replaceWith: rewriteRule tree. 
	Author 
		useAuthor: 'AutoDeprecationRefactoring'
		during: [aMethod origin compile: aMethod ast formattedCode classified: aMethod protocol].	
	Log 
		ifNotNil: [:log | log add: self].
	self logTranscript
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>version: aString [
	versionString := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Deprecation>>versionString [

	^ versionString ifNil: [ 'unknown' ]
]
