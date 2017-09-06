"
This action is responsible for profiling  a selected piece of code from the code pane of the debugger.
"
Class {
	#name : #GTProfileSelectionDebugAction,
	#superclass : #GTCodeDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:43'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTProfileSelectionDebugAction class>>gtActionFor: aDebugger [
	"<gtContextCodeDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTProfileSelectionDebugAction>>defaultLabel [

	^ 'Profile it'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTProfileSelectionDebugAction>>defaultOrder [

	^ 30
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTProfileSelectionDebugAction>>executeAction [
	
	self codePresentation profileSelection
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTProfileSelectionDebugAction>>id [

	^ #gTProfileSelectionDebugAction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTProfileSelectionDebugAction>>initialize [
	super initialize.
	self needsUpdate: false
]
