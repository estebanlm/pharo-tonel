"
I am an action for switching to another debugger.
My class side methods register one such action for every debugger that can be used with the current execution.
"
Class {
	#name : #GTChangeDebuggerAction,
	#superclass : #DebugAction,
	#instVars : [
		'debuggerClass',
		'newDebugger'
	],
	#category : #GT-Debugger-Actions,
	#timestamp : 'AndreiChis 12/30/2015 11:24'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction class>>changeDebuggerActionsForContext: aContext excluding: aDebugger [
	
	^ (self debuggersForContext: aContext excluding: aDebugger) collect: [ :aDebuggerClass | 
		(self forDebugger: aDebugger)
			debuggerClass: aDebuggerClass;
			icon: (Form extent: 0@0) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction class>>debuggersForContext: aContext excluding: aDebugger  [
	"Ungly check to make sure the debugger will work until everything is in the image"
	(Smalltalk tools respondsTo: #debuggersForContext:) 
		ifTrue: [ ^ (Smalltalk tools debuggersForContext: aContext) reverse
			remove: aDebugger class ifAbsent: [ ];
			yourself]
		ifFalse: [ ^ OrderedCollection new ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction class>>gtChangeDebuggerActionsFor: aDebugger [
	<gtDebuggingAction>
	
	^ self 
		changeDebuggerActionsForContext: aDebugger interruptedContext 
		excluding: aDebugger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction>>debuggerClass: aClass [

	debuggerClass := aClass.
	self label: debuggerClass defaultTitle.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction>>defaultCategory  [
	
	^ 'Available Debuggers'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction>>defaultOrder [

	^ 100
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction>>executeAction [

	 newDebugger := self debugger debug: self interruptedContext using: debuggerClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction>>initialize [
	super initialize.
	self needsUpdate: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTChangeDebuggerAction>>newDebugger [
	^ newDebugger
]
