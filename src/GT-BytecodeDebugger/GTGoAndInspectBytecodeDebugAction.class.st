"
I am a debugging action that inspects the currently selected bytecode.

"
Class {
	#name : #GTGoAndInspectBytecodeDebugAction,
	#superclass : #DebugAction,
	#category : #GT-BytecodeDebugger-Actions,
	#timestamp : 'AndreiChis 12/30/2015 10:53'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTGoAndInspectBytecodeDebugAction class>>gtBytecodeDebuggerActionFor: aDebugger [
	<gtContextBytecodeCodeDebuggingAction>
	
	^ (self forDebugger: aDebugger)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTGoAndInspectBytecodeDebugAction>>defaultKeymap [

	^ $g meta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTGoAndInspectBytecodeDebugAction>>defaultLabel [

	^ 'Go and inspect'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTGoAndInspectBytecodeDebugAction>>executeAction [
	
	self debugger inspect: self debugger bytecodePresentation selection  
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTGoAndInspectBytecodeDebugAction>>id [

	^ GTGoAndInspectBytecodeDebugAction name
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTGoAndInspectBytecodeDebugAction>>initialize [

	super initialize.
	self needsUpdate: false
]
