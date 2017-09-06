Extension {
	#name : #RBMessageNode
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBMessageNode>>specialCommands [
	^ SugsSuggestionFactory commandsForMessage
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBMessageNode>>sugsMenuLabel [
	^ self selector
]
