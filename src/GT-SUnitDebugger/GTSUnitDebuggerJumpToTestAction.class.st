"
I implement a debugging action for selecting in the stack the context containing the test  method.
  
I am only valid if the context that triggered the failed assertion is diffferent than the context containing the test method (e.g., the assertion method was called from an utility method of the test)
"
Class {
	#name : #GTSUnitDebuggerJumpToTestAction,
	#superclass : #DebugAction,
	#category : #GT-SUnitDebugger,
	#timestamp : 'AndreiChis 1/22/2016 14:32'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerJumpToTestAction class>>gtDebuggerActionFor: aDebugger [
	<gtStackDebuggingAction>
	
	^ (self forDebugger: aDebugger)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerJumpToTestAction>>appliesToDebugger: aDebugger [

	^ aDebugger session class = GTSUnitDebugSession and: [ 
		aDebugger session assertionCallerContext notNil and: [ 
			aDebugger session testContext ~= aDebugger session assertionCallerContext ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerJumpToTestAction>>defaultLabel [

	^ 'Jump to test method'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerJumpToTestAction>>defaultOrder [

	^ 10
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerJumpToTestAction>>executeAction [
	self debugger stackPresentation selection: self debugger session testContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerJumpToTestAction>>id [

	^ GTSUnitDebuggerJumpToTestAction name
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitDebuggerJumpToTestAction>>initialize [
	super initialize.
	self needsUpdate: false
]
