"
A RunToSelectionDebugAction resumes the execution until the selected position in the source code is reached.
"
Class {
	#name : #RunToSelectionDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
RunToSelectionDebugAction class>>actionType [
	<debuggingAction>
	<contextMenuCodeDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RunToSelectionDebugAction>>defaultHelp [

	^ 'Execute methods up to the text cursor position and return debugger control.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RunToSelectionDebugAction>>defaultLabel [

	^ 'Run to here'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RunToSelectionDebugAction>>defaultOrder [

	^ 35
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
RunToSelectionDebugAction>>executeAction [

	self session 
		runToSelection: self debugger code getSelection 
		inContext: self currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
RunToSelectionDebugAction>>id [

	^ #runToHere
]
