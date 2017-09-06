Extension {
	#name : #GLMRubricSmalltalkTextModel
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
GLMRubricSmalltalkTextModel>>sugsContext [

	^ SugsGlamourCodeContext model: self
]
