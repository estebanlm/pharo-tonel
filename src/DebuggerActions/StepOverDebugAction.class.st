"
A StepOverDebugAction the current context.

"
Class {
	#name : #StepOverDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepOverDebugAction class>>actionType [
	<debuggingAction>
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepOverDebugAction>>defaultHelp [
	^ 'Step over the highlighted message, i.e. do not follow the sent message, taking debugger control after the method invoked returns.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepOverDebugAction>>defaultKeymap [

	^ PharoShortcuts current stepOverShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepOverDebugAction>>defaultLabel [

	^ 'Over'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepOverDebugAction>>defaultOrder [

	^ 20
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepOverDebugAction>>executeAction [

	self session stepOver: self currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepOverDebugAction>>id [

	^ #stepOver
]
