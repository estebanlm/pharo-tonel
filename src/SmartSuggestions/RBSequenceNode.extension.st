Extension {
	#name : #RBSequenceNode
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBSequenceNode>>specialCommands  [
	^ SugsSuggestionFactory commandsForSource.
]
