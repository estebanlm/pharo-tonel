"
A ResumeDebugAction resumes the execution of the interrupted process and closes the debugger.

"
Class {
	#name : #ResumeDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction class>>actionType [
	<debuggingAction>
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>defaultHelp [
	^ 'Relinquish debugger control and proceed execution from the current point of debugger control.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>defaultKeymap [

	^ PharoShortcuts current resumeExecutionShortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>defaultLabel [

	^ 'Proceed'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>defaultOrder [

	^ 5
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>enabled [

	^ self interruptedContextIsPostMortem not
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>executeAction [

	self session 
		resume;
		clear.
	self debugger close. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>id [

	^ #resume
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>initialize [

	super initialize.
	"No need to update the debgger as it will anyway be closed."
	self needsUpdate: false 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
ResumeDebugAction>>interruptedContextIsPostMortem [

	^ (self session isContextPostMortem: self interruptedContext) 
]
