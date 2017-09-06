"
This action is responsible for printing a selected piece of code from the code pane of the debugger.
"
Class {
	#name : #GTPrintSelectionDebugAction,
	#superclass : #GTCodeDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:43'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPrintSelectionDebugAction class>>gtActionFor: aDebugger [
	"<gtContextCodeDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPrintSelectionDebugAction>>defaultKeymap [

	^ PharoShortcuts current printItShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPrintSelectionDebugAction>>defaultLabel [

	^ 'Print it'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPrintSelectionDebugAction>>defaultOrder [

	^ 15
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPrintSelectionDebugAction>>executeAction [
	
	self codePresentation printSelection
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPrintSelectionDebugAction>>id [

	^ #gTPrintSelectionDebugAction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPrintSelectionDebugAction>>initialize [
	super initialize.
	self needsUpdate: false
]
