Extension {
	#name : #RBBlockNode
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBBlockNode>>specialCommands [
	^ SugsSuggestionFactory commandsForBlock
]
