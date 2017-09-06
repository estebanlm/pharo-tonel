"
A FullStackDebugAction displays the entire stack in the stack widget.

"
Class {
	#name : #FullStackDebugAction,
	#superclass : #DebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:17'
}
FullStackDebugAction class>>actionType [
	<debuggingAction>
	<contextMenuDebuggingAction>
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FullStackDebugAction>>defaultLabel [

	^ 'Full Stack'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FullStackDebugAction>>defaultOrder [

	^ 30
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FullStackDebugAction>>enabled [

	^ self shouldEnableFullStackButton
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:17'
}
FullStackDebugAction>>executeAction [
	
	self debugger stack expandBy: self expandedStackSize
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FullStackDebugAction>>expandedStackSize [

	^ 100000
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FullStackDebugAction>>id [

	^ #fullStack
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
FullStackDebugAction>>shouldEnableFullStackButton [

	self debugger ifNil: [ ^ false ].  
		
	^ self debugger stack listItems 
		ifEmpty: [ false ] 
		ifNotEmpty: [ :aList |
			aList last sender notNil ] 
]
