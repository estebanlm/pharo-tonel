"
A GTGenericStackDebuggerSelectionChanged is an event send to the debugger after the selection in the stack pane is changed.
"
Class {
	#name : #GTGenericStackDebuggerSelectionChanged,
	#superclass : #Announcement,
	#instVars : [
		'debugger',
		'newContext'
	],
	#category : #GT-Debugger-UI,
	#timestamp : 'RogerStebler 3/15/2016 14:07'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTGenericStackDebuggerSelectionChanged class>>forDebugger: aDebugger [

	^ self new forDebugger: aDebugger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTGenericStackDebuggerSelectionChanged>>debugger [

	^ debugger
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTGenericStackDebuggerSelectionChanged>>forDebugger: aDebugger [

	debugger := aDebugger.
	newContext := aDebugger currentContext.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTGenericStackDebuggerSelectionChanged>>newContext [

	^ newContext
]
