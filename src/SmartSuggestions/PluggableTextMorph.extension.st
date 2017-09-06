Extension {
	#name : #PluggableTextMorph
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
PluggableTextMorph>>smartSuggestions [
	self handleEdit: [textMorph editor smartSuggestions]
]
