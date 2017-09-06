"
A RestartDebugAction restarts the execution of the current context.

"
Class {
	#name : #RestartDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
RestartDebugAction class>>actionType [
	<debuggingAction>
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RestartDebugAction>>defaultHelp [
	^ 'Go back the start of the current execution context, resetting all local variables and take debugger control.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RestartDebugAction>>defaultKeymap [

	^ PharoShortcuts current restartExecutionShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RestartDebugAction>>defaultLabel [

	^ 'Restart'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RestartDebugAction>>defaultOrder [

	^ 10
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
RestartDebugAction>>executeAction [

	self session restart: self currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RestartDebugAction>>id [

	^ #restart
]
