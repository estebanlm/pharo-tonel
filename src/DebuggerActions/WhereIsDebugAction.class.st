"
A WhereIsDebugAction highlights in the code editor the current instruction.

"
Class {
	#name : #WhereIsDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
WhereIsDebugAction class>>actionType [
	<debuggingAction>
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
WhereIsDebugAction>>defaultHelp [

	^ 'Highligh the next method to be executed (step) by the debugger.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
WhereIsDebugAction>>defaultLabel [

	^ 'Where is?'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
WhereIsDebugAction>>defaultOrder [

	^ 40
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
WhereIsDebugAction>>executeAction [

	self debugger code setSelection: (self session 
		pcRangeForContext:  self currentContext)	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
WhereIsDebugAction>>id [

	^ #whereIs
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
WhereIsDebugAction>>initialize [

	super initialize.
	"This action just updates the selection in the code editor. 
	No need to do any update or validation."
	self needsUpdate: false.
	self needsValidation: false.
	self withSeparatorAfter
]
