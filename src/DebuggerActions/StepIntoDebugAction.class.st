"
A StepIntoDebugAction the current context.

"
Class {
	#name : #StepIntoDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepIntoDebugAction class>>actionType [
	<debuggingAction>
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepIntoDebugAction>>defaultHelp [
	^ 'Step in the highlighted message, i.e. follow the sent message, taking debugger control in the method invoked.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepIntoDebugAction>>defaultKeymap [

	^ PharoShortcuts current stepIntoShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepIntoDebugAction>>defaultLabel [

	^ 'Into'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepIntoDebugAction>>defaultOrder [

	^ 15
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepIntoDebugAction>>executeAction [

	self session stepInto: self currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepIntoDebugAction>>id [

	^ #stepInto
]
