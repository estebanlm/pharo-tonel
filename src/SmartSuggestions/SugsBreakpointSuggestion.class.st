"
This class is an abstrat class for defining breakpoint commands
"
Class {
	#name : #SugsBreakpointSuggestion,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : 'MarcusDenker 11/17/2015 15:52'
}

{
	#category : #breakpoints,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakpointSuggestion>>hasUnacceptedEdits [
	context ifNil: [ ^false ].
	^context hasUnacceptedEdits
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakpointSuggestion>>label [
	self subclassResponsibility
]

{
	#category : #breakpoints,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakpointSuggestion>>selectedNodeHasBreakpoint [
	context ifNil: [ ^false ].
	^ context selectedNode hasBreakpoint
]
