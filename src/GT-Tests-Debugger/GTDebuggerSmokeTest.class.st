"

"
Class {
	#name : #GTDebuggerSmokeTest,
	#superclass : #TestCase,
	#instVars : [
		'session',
		'window',
		'debugger'
	],
	#category : #GT-Tests-Debugger,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDebuggerSmokeTest class>>isAbstract [
	^ self name = #GTDebuggerSmokeTest
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDebuggerSmokeTest>>assertDebuggerClosing [
	
 	debugger close.

	self assert: window model equals: nil.
	self assert: debugger session interruptedContext equals: nil.
	self assert: debugger session interruptedProcess equals: nil.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDebuggerSmokeTest>>assertDebuggerInitialization [
	
	self assert: (debugger class handlesContext: session interruptedContext).
	
	window := debugger openOn: session.
	
	self assert: window model equals: debugger.
	self assert: debugger session interruptedContext notNil.
	self assert: debugger session interruptedProcess notNil.
	
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDebuggerSmokeTest>>assertDebuggerInitializationForContext: aContext andStepBlock: aBlock [

	self 
		initializeSessionForContext: aContext
		withStepBlock: aBlock.

	self assertDebuggerInitialization.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDebuggerSmokeTest>>debuggerToTest [
	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDebuggerSmokeTest>>initializeSessionForContext: aContext withStepBlock: aBlock [
	| process |

	process := Process 
		forContext: aContext
		priority: Processor userInterruptPriority.
	
	aBlock value: process.
	session := self debuggerToTest spanNewSessionLabeled:  'test session' forContext: process suspendedContext fromProcess: process
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDebuggerSmokeTest>>setUp [
	debugger := self debuggerToTest new.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDebuggerSmokeTest>>tearDown  [
	debugger ifNotNil: [ debugger close].
	window := nil.
	debugger := nil.
	session := nil.
]
