"
This action encapsulates the logic of debugging a selected piece of code from the code pane of the debugger.
"
Class {
	#name : #GTDebugSelectionDebugAction,
	#superclass : #GTCodeDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:42'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebugSelectionDebugAction class>>gtActionFor: aDebugger [
	"<gtContextCodeDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebugSelectionDebugAction>>defaultKeymap [

	^ PharoShortcuts current debugItShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebugSelectionDebugAction>>defaultLabel [

	^ 'Debug it'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebugSelectionDebugAction>>defaultOrder [

	^ 20
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebugSelectionDebugAction>>executeAction [
	
	self codePresentation debugSelection
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebugSelectionDebugAction>>id [

	^ #gTDebugSelectionDebugAction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTDebugSelectionDebugAction>>initialize [
	super initialize.
	self needsUpdate: false
]
