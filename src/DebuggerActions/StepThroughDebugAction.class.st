"
A StepThroughDebugAction through the execution until control returns to the current method.

"
Class {
	#name : #StepThroughDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepThroughDebugAction class>>actionType [
	<debuggingAction>
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepThroughDebugAction>>defaultHelp [
	^ 'Step over the highlighted message, i.e. do not follow the sent message, taking debugger control after the method invoked returns or whenever execution should return inside a block used as an argument before that.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepThroughDebugAction>>defaultKeymap [

	^ PharoShortcuts current stepThroughShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepThroughDebugAction>>defaultLabel [

	^ 'Through'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepThroughDebugAction>>defaultOrder [

	^ 25
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepThroughDebugAction>>executeAction [

	self session stepThrough: self currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StepThroughDebugAction>>id [

	^ #stepThrough
]
