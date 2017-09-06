Extension {
	#name : #HelpBrowser
}

{
	#category : #'*Shout-Styling',
	#timestamp : ' 8/31/2017 05:26:28'
}
HelpBrowser>>shoutAboutToStyle: aPluggableShoutMorphOrView  [
	^ (self rootTopic respondsTo: #canHaveSyntaxHighlighting)
				and: [self rootTopic canHaveSyntaxHighlighting]
]
