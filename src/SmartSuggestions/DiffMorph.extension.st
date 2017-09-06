Extension {
	#name : #DiffMorph
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
DiffMorph>>sugsContext [
	^ SugsDiffModelContext model: self 
]
