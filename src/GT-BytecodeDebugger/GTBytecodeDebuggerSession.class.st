"
I provide debugging actions at the level of the bytecode.
I also make sure  that step over only goes over one single bytecode instruction.
"
Class {
	#name : #GTBytecodeDebuggerSession,
	#superclass : #DebugSession,
	#category : #GT-BytecodeDebugger-Model,
	#timestamp : 'AndreiChis 12/30/2015 10:51'
}

{
	#category : #'debugging actions',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebuggerSession>>runToBytecode: aSymbolicBytecode inContext: aContext  [
	"Attempt to step over instructions in selectedContext until the 
	execution reaches the selected instruction. This happens when the
	program counter passes the begining of selectionInterval." 
	
	aSymbolicBytecode offset <= aContext pc 
		ifTrue: [ ^self ].
	self stepOver: aContext.
	[ aContext == self interruptedContext and: [ aContext pc < aSymbolicBytecode offset ] ] 
		whileTrue: [ self stepOver: aContext ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebuggerSession>>stepToFirstInterestingBytecodeIn: aProcess [
	"Do not step over any bytecode."
	
	^ aProcess suspendedContext
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTBytecodeDebuggerSession>>symbolicBytecodeForCurrentPCFrom: aContext [
	| pc |
	
	pc := aContext pc.
	^ aContext method symbolicBytecodes 
		detect: [ :each | each offset = pc ]
		ifNone: [ nil ]
]
