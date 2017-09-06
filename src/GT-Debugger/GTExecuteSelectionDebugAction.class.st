"
This action is responsible for executing a selected piece of code from the code pane of the debugger.
"
Class {
	#name : #GTExecuteSelectionDebugAction,
	#superclass : #GTCodeDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:42'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTExecuteSelectionDebugAction class>>gtActionFor: aDebugger [
	"<gtContextCodeDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousSpawn
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTExecuteSelectionDebugAction>>defaultKeymap [

	^ PharoShortcuts current doItShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTExecuteSelectionDebugAction>>defaultLabel [

	^ 'Do it'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTExecuteSelectionDebugAction>>defaultOrder [

	^ 10
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTExecuteSelectionDebugAction>>executeAction [
	
	self codePresentation evaluateSelection
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTExecuteSelectionDebugAction>>id [

	^ #gTExecuteSelectionDebugAction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTExecuteSelectionDebugAction>>initialize [
	super initialize.
	self needsUpdate: false
]
