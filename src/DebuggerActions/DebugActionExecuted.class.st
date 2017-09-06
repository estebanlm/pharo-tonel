"
A DebugActionExecuted is an event send to the debugger after a debugging action is executed.

Instance Variables
	actionId:		<Object>

actionId
	- xxxxx

"
Class {
	#name : #DebugActionExecuted,
	#superclass : #Announcement,
	#instVars : [
		'debuggingAction'
	],
	#category : #DebuggerActions,
	#timestamp : 'AndreiChis 11/19/2015 20:13'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:17'
}
DebugActionExecuted class>>forDebuggingAction: anAction [

	^ self new
		action: anAction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
DebugActionExecuted>>action [

	^ debuggingAction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
DebugActionExecuted>>action: aDebuggingAction [

	debuggingAction := aDebuggingAction
]
