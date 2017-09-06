Extension {
	#name : #RBVariableNode
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBVariableNode>>specialCommands [
	^self binding specialCommands
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
RBVariableNode>>sugsMenuLabel [
	^ name
]
