"
SUnit tests for the debugger model
"
Class {
	#name : #DebuggerModelTest,
	#superclass : #TestCase,
	#instVars : [
		'session',
		'process',
		'context'
	],
	#category : #Debugger-Tests,
	#timestamp : 'TorstenBergmann 2/20/2014 15:44'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:41'
}
DebuggerModelTest>>setUp [

	context := [ Set new ] asContext.
	process := Process 
		forContext: context 
		priority: Processor userInterruptPriority.
		
	session:= process newDebugSessionNamed: 'test session' startedAt: context.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
DebuggerModelTest>>testCorrectlyCreateDebugSession [

	self assert: session isNotNil.	
	self assert: process isSuspended.
	self assert: session interruptedContext equals: context.
	self assert: session interruptedContext printString equals: '[ Set new ] in DebuggerModelTest>>setUp'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
DebuggerModelTest>>testStepInto [

	self deny: (session isContextPostMortem: context).
	self assert: session interruptedContext equals: context.
	self assert: session interruptedContext printString equals: '[ Set new ] in DebuggerModelTest>>setUp' .

	session 
		stepInto;
		stepInto.

	self assert: session interruptedContext printString equals: 'Set class(HashedCollection class)>>new'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
DebuggerModelTest>>testStepOver [

	self assert: session interruptedContext equals: context.
	self assert: session interruptedContext printString equals: '[ Set new ] in DebuggerModelTest>>setUp' .

	session stepOver.

	self assert: session interruptedContext printString equals: '[ Set new ] in DebuggerModelTest>>setUp'.
]
