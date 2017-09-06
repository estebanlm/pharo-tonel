"

"
Class {
	#name : #GTGenericStackDebuggerSmokeTest,
	#superclass : #GTDebuggerSmokeTest,
	#category : #GT-Tests-Debugger,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTGenericStackDebuggerSmokeTest>>debuggerToTest [

	^ GTGenericStackDebugger
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTGenericStackDebuggerSmokeTest>>testDebugger [

	self 
		assertDebuggerInitializationForContext: [ 20 factorial ] asContext 
		andStepBlock: [:aProcess | "The generic debugger can handle any context" ].

 	self assertDebuggerClosing.
]
