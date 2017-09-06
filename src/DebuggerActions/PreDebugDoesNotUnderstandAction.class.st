"
A PreDebugDoesNotUnderstandAction adds the DoesNotUnderstandDebugAction debugging actions to the pre debug window. When executed, it will further close the pre debug window and open the full debugger. 

Instance Variables
	preDebugWindow:		<Object>

preDebugWindow
	- xxxxx

"
Class {
	#name : #PreDebugDoesNotUnderstandAction,
	#superclass : #DoesNotUnderstandDebugAction,
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
PreDebugDoesNotUnderstandAction class>>actionType [
	<preDebuggingAction>
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugDoesNotUnderstandAction>>executeAction [

	"The create method from the session will trigger #contextChanged, which will
	make the debgger update the stack. Sof it safe to just open the debugger."
	super executeAction.
	self preDebugWindow openFullDebugger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugDoesNotUnderstandAction>>id [

	^ #preDebugDoesNotUnderstand
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugDoesNotUnderstandAction>>initialize [
	
	super initialize.
	self needsUpdate: false.
	self needsValidation: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugDoesNotUnderstandAction>>preDebugWindow [
	
	^ preDebugWindow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugDoesNotUnderstandAction>>preDebugWindow: anObject [
	
	preDebugWindow := anObject
]
