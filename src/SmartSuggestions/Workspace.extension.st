Extension {
	#name : #Workspace
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
Workspace>>sourceTextArea [
	^ self textView
]

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
Workspace>>sugsContext [
	^ SugsWorkspaceContext model: self
]
