"
This action adds the possibility of opening a GTDebugger from the PreDebugWindow.
"
Class {
	#name : #GTTemporaryPreDebugChangeDebuggerAction,
	#superclass : #DebugAction,
	#instVars : [
		'preDebugWindow'
	],
	#category : #GT-Debugger-Actions,
	#timestamp : 'TudorGirba 1/10/2016 23:45'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTTemporaryPreDebugChangeDebuggerAction class>>actionType [
	<preDebuggingAction>
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTTemporaryPreDebugChangeDebuggerAction>>appliesToDebugger: aDebugger [

	^ (aDebugger class inheritsFrom: GTMoldableDebugger) not 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTTemporaryPreDebugChangeDebuggerAction>>defaultLabel [

	^ 'Debug Glamorously'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTTemporaryPreDebugChangeDebuggerAction>>defaultOrder [

	^ 200
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTTemporaryPreDebugChangeDebuggerAction>>executeAction [
	| currentDebugger currentSession |
	
	"Close the spec PreDebugWindow and debugger"
	currentDebugger := self preDebugWindow debugger.
	self preDebugWindow debugger: nil.
	self preDebugWindow close.
	currentSession := currentDebugger session.
	currentDebugger session: nil.
	currentDebugger clear. "clear not close, as at this point there is no open window to close"
	
	GTGenericStackDebugger debugSession: currentSession
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTTemporaryPreDebugChangeDebuggerAction>>id [

	^ #gtChangeDebuggerPreDebug
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTTemporaryPreDebugChangeDebuggerAction>>preDebugWindow [
	
	^ preDebugWindow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTTemporaryPreDebugChangeDebuggerAction>>preDebugWindow: anObject [
	
	preDebugWindow := anObject
]
