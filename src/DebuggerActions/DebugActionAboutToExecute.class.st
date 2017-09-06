"
A DebugActionAboutToExecute is an event send to the debugger before a debugging action is executed.
"
Class {
	#name : #DebugActionAboutToExecute,
	#superclass : #Announcement,
	#instVars : [
		'debuggingAction'
	],
	#category : #DebuggerActions,
	#timestamp : 'RogerStebler 3/5/2016 14:18'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:17'
}
DebugActionAboutToExecute class>>forDebuggingAction: anAction [

	^ self new
		action: anAction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
DebugActionAboutToExecute>>action [

	^ debuggingAction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
DebugActionAboutToExecute>>action: aDebuggingAction [

	debuggingAction := aDebuggingAction
]
