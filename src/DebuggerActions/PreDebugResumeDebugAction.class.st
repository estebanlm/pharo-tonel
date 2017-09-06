"
A PreDebugResumeDebugAction adds the ResumeDebugAction to the pre debug window.

Instance Variables
	preDebugWindow:		<Object>

preDebugWindow
	- xxxxx

"
Class {
	#name : #PreDebugResumeDebugAction,
	#superclass : #ResumeDebugAction,
	#instVars : [
		'preDebugWindow'
	],
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugResumeDebugAction class>>actionType [
	<preDebuggingAction>
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugResumeDebugAction>>executeAction [

	self session 
		resume;
		clear.
	self preDebugWindow close. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugResumeDebugAction>>id [

	^ #preDebugResume
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugResumeDebugAction>>initialize [

	super initialize.
	self needsUpdate: false.
	self needsValidation: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugResumeDebugAction>>preDebugWindow [
	
	^ preDebugWindow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugResumeDebugAction>>preDebugWindow: anObject [
	
	preDebugWindow := anObject
]
