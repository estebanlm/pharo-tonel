Extension {
	#name : #RBMethodNode
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBMethodNode>>specialCommands [
	 ^SugsSuggestionFactory commandsForMethod.
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBMethodNode>>sugsMenuLabel [
	^ self selector
]
