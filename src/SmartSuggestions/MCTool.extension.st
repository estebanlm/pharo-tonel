Extension {
	#name : #MCTool
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCTool>>sugsContext [
	
	^ SugsMonticelloToolContext model: self
]
