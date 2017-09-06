"
I am debugging action for sending a unary message to the debugger.
"
Class {
	#name : #GTBrowseDebugAction,
	#superclass : #BrowseDebugAction,
	#category : #GT-Debugger-Actions,
	#timestamp : 'AndreiChis 12/30/2015 11:13'
}

{
	#category : #'actions creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowseDebugAction class>>gtDebugActionsFor: aDebugger [
	<gtContextStackDebuggingAction>
	
	^ super debugActionsFor: aDebugger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowseDebugAction>>receiver [

	^ self debugger
]
