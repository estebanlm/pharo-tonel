Extension {
	#name : #RBProgramNode
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBProgramNode>>specialCommands [
	^#().
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBProgramNode>>suggestions [
	^SugsSuggestionFactory globalCommands addAll: self specialCommands; yourself 
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBProgramNode>>sugsMenuLabel [
	^ self formattedCode
]
