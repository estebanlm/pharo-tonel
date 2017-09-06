Extension {
	#name : #MCVersionNameAndMessageRequest
}

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionNameAndMessageRequest>>defaultAction [
	^ MCSaveVersionDialog new
		versionName: suggestion;
		logMessage: suggestedLogComment;
		showModally
]
