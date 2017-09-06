Extension {
	#name : #ThreadSafeTranscript
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
ThreadSafeTranscript>>sugsContext [
	^ SugsTranscriptContext model: self
]
