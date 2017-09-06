"

"
Class {
	#name : #GTBytecodeDebuggerSmokeTest,
	#superclass : #GTDebuggerSmokeTest,
	#category : #GT-Tests-Debugger,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTBytecodeDebuggerSmokeTest>>debuggerToTest [

	^ GTBytecodeDebugger
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTBytecodeDebuggerSmokeTest>>testDebugger [

	self 
		assertDebuggerInitializationForContext: [ 20 factorial ] asContext 
		andStepBlock: [:aProcess | "The bytecode debugger can handle any context" ].

 	self assertDebuggerClosing.
]
