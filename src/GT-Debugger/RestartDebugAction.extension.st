Extension {
	#name : #RestartDebugAction
}

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
RestartDebugAction class>>gtGlobalDebuggingActionFor: aDebugger [
	<gtDebuggingAction>
	
	^ (self forDebugger: aDebugger)
		label: nil
]

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
RestartDebugAction class>>gtStackDebuggingActionFor: aDebugger [
	<gtStackDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousRestart
]
