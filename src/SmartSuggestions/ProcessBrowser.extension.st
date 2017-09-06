Extension {
	#name : #ProcessBrowser
}

{
	#category : #'*SmartSuggestions',
	#timestamp : ' 8/31/2017 05:26:39'
}
ProcessBrowser>>sugsContext [

	^ SugsProcessBrowserContext model: self
]
