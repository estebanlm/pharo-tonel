Extension {
	#name : #SubclassResponsabilityDebugAction
}

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
SubclassResponsabilityDebugAction class>>gtStackDebuggingActionFor: aDebugger [
	<gtStackDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousAdd
]
