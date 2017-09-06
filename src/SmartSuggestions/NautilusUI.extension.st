Extension {
	#name : #NautilusUI
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
NautilusUI>>sugsContext [
	^ SugsNautilusContext model: self.
]
