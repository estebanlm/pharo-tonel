"
This class defines AST node menus for breakpoints
"
Class {
	#name : #SugsBreakAlwaysSuggestion,
	#superclass : #SugsBreakpointSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : 'MarcusDenker 11/17/2015 15:51'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakAlwaysSuggestion>>execute [
	context hasUnacceptedEdits ifTrue: [ ^context sourceTextArea acceptEdits].
	
	self selectedNodeHasBreakpoint 
		ifFalse: [Breakpoint new node: context selectedNode; always; install]
		ifTrue: [ Breakpoint removeFrom: context selectedNode]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakAlwaysSuggestion>>label [
	self hasUnacceptedEdits ifTrue: [ ^'Accept to enable breakpoints' ].

	^self selectedNodeHasBreakpoint
		ifFalse: [ 'Break' translated ]
		ifTrue: [ 'Remove breakpoint' translated ]
]
