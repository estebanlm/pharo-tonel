"
This class defines AST node menus for one time breakpoints
"
Class {
	#name : #SugsBreakOnceSuggestion,
	#superclass : #SugsBreakpointSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : 'MarcusDenker 11/17/2015 15:51'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakOnceSuggestion>>execute [
	context hasUnacceptedEdits ifTrue: [ ^context sourceTextArea acceptEdits].
	
	self selectedNodeHasBreakpoint 
		ifFalse: [Breakpoint new node: context selectedNode; once; install]
		ifTrue: [ Breakpoint removeFrom: context selectedNode]
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakOnceSuggestion>>isValidForContext [
	^self selectedNodeHasBreakpoint not and: [self hasUnacceptedEdits not and:[ super isValidForContext ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakOnceSuggestion>>label [
	^ 'Break once' translated
]
