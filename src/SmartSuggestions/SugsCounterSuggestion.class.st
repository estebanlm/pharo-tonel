"
I am creating Counters on AST nodes
"
Class {
	#name : #SugsCounterSuggestion,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : 'MarcusDenker 6/21/2016 15:21'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCounterSuggestion>>execute [
	context ifNil: [ ^self ].
	context hasUnacceptedEdits ifTrue: [ ^context sourceTextArea acceptEdits].
	
	context selectedNode hasExecutionCounter
		ifFalse: [ ExecutionCounter installOn: context selectedNode]
		ifTrue: [ ExecutionCounter removeFrom: context selectedNode]
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCounterSuggestion>>isValidForContext [
	context ifNil: [ ^false ].
	^context hasUnacceptedEdits not
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCounterSuggestion>>label [
	^self selectedNodeHasExecutionCounter
		ifFalse: [ 'Add Counter' translated ]
		ifTrue: [ 'Remove Counter' translated ]
	
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCounterSuggestion>>selectedNodeHasExecutionCounter [
	context ifNil: [ ^false ].
	^context selectedNode hasExecutionCounter
]
