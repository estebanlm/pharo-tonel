"
This action is responsible for continuing the execution up to the point selected in the code pane.
"
Class {
	#name : #GTRunToSelectionDebugAction,
	#superclass : #RunToSelectionDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:41'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTRunToSelectionDebugAction class>>gtActionFor: aDebugger [
	<gtContextCodeDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousPlay
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTRunToSelectionDebugAction>>defaultOrder [

	^ 1
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTRunToSelectionDebugAction>>executeAction [

	self session 
		runToSelection: self debugger selectionInterval
		inContext: self currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTRunToSelectionDebugAction>>id [

	^ #gtRunToSelection
]
