Extension {
	#name : #MorphicTextAdapter
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
MorphicTextAdapter>>sugsContext [
	^SugsMorphicTextAdapterContext model: self
]
