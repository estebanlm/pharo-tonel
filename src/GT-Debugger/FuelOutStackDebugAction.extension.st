Extension {
	#name : #FuelOutStackDebugAction
}

{
	#category : #'*GT-Debugger-Actions',
	#timestamp : ' 8/31/2017 05:26:36'
}
FuelOutStackDebugAction class>>gtActionFor: aDebugger [
	<gtStackDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			order: 30
]
