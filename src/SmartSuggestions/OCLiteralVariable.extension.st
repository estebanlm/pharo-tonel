Extension {
	#name : #OCLiteralVariable
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
OCLiteralVariable>>specialCommands [
	^self assoc isClassVariable 
		ifTrue: [SugsSuggestionFactory commandsForClassVariable]
		ifFalse:[ ^SugsSuggestionFactory commandsForClass]
]
