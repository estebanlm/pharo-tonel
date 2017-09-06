Extension {
	#name : #RunToSelectionDebugAction
}

{
	#category : #'*GT-Debugger',
	#timestamp : ' 8/31/2017 05:26:36'
}
RunToSelectionDebugAction class>>gtActionFor: aDebugger [
	"<gtCodeDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousPlay
]
