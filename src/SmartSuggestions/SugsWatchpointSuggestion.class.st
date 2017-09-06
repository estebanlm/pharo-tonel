"
This class defines AST node menus for watchpoints
"
Class {
	#name : #SugsWatchpointSuggestion,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : 'mcamp 11/20/2015 12:08'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsWatchpointSuggestion>>execute [
	context ifNil: [ ^self ].
	context hasUnacceptedEdits ifTrue: [ ^context sourceTextArea acceptEdits].
	
	context selectedNode hasWatchpoint
		ifFalse: [ Watchpoint in: context selectedNode ]
		ifTrue: [ Watchpoint removeFrom: context selectedNode]
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsWatchpointSuggestion>>isValidForContext [
	context ifNil: [ ^false ].
	^context hasUnacceptedEdits not
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsWatchpointSuggestion>>label [
	^self selectedNodeHasWatchpoint
		ifFalse: [ 'Add Watchpoint' translated ]
		ifTrue: [ 'Remove Watchpoint' translated ]
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsWatchpointSuggestion>>selectedNodeHasWatchpoint [
	context ifNil: [ ^false ].
	^context selectedNode hasWatchpoint
]
