"
A PreDebugAction is a debugging actions sending a unary message to the pre debug window.

"
Class {
	#name : #PreDebugAction,
	#superclass : #MessageSendDebugAction,
	#instVars : [
		'preDebugWindow'
	],
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #'actions creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugAction class>>debugActionsFor: aDebugger [
	<preDebuggingAction>
	
	^ { 
		self new
			id: #abandonAction;
			selector: #close;
			order: 10;
			label: 'Abandon'.
		self new
			id: #openFullDebuggerAction;
			selector: #openFullDebugger;
			order: 15;
			label: 'Debug'
	}
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugAction>>initialize [

	super initialize.
	self needsUpdate: false.
	self needsValidation: false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugAction>>preDebugWindow [
	
	^ preDebugWindow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugAction>>preDebugWindow: anObject [
	
	preDebugWindow := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PreDebugAction>>receiver [

	^ self preDebugWindow
]
