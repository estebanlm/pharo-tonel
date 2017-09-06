"
A PreDebugSubclassResponsabilityAction adds the SubclassResponsabilityDebugAction debugging actions to the pre debug window. When executed, it will further close the pre debug window and open the full debugger. 

Instance Variables
	preDebugWindow:		<Object>

preDebugWindow
	- xxxxx

"
Class {
	#name : #PreDebugSubclassResponsabilityAction,
	#superclass : #SubclassResponsabilityDebugAction,
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
PreDebugSubclassResponsabilityAction class>>actionType [
	<preDebuggingAction>
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugSubclassResponsabilityAction>>executeAction [
	
	super executeAction.
	self preDebugWindow openFullDebugger "Open the full debugger"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugSubclassResponsabilityAction>>id [

	^ #preDebugSubclassResponsability
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugSubclassResponsabilityAction>>initialize [

	super initialize.
	self needsUpdate: false.
	self needsValidation: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugSubclassResponsabilityAction>>preDebugWindow [
	
	^ preDebugWindow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugSubclassResponsabilityAction>>preDebugWindow: anObject [
	
	preDebugWindow := anObject
]
