"
This class defines AST node menus for conditional  breakpoints
"
Class {
	#name : #SugsBreakConditionSuggestion,
	#superclass : #SugsBreakpointSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : 'MarcusDenker 11/17/2015 15:51'
}

{
	#category : #breakpoints,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakConditionSuggestion>>breakpointForCondition [
	(UIManager default request: 'Break on what condition?')	
		ifNotNil: [ :condition | Breakpoint new 
			node: context selectedNode;
			condition: (Smalltalk compiler evaluate: condition);
			install]
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakConditionSuggestion>>execute [
	context hasUnacceptedEdits ifTrue: [ ^context sourceTextArea acceptEdits].
	
	self selectedNodeHasBreakpoint 
		ifFalse: [ self breakpointForCondition ]
		ifTrue: [ Breakpoint removeFrom: context selectedNode]
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakConditionSuggestion>>isValidForContext [
	^self selectedNodeHasBreakpoint not and: [self hasUnacceptedEdits not and:[ super isValidForContext ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBreakConditionSuggestion>>label [
	^'Break on condition' translated
]
