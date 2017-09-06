Extension {
	#name : #EpLog
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>browseEvents [
	"Browse all events from my head."
	
	^ EpLogBrowserModel openWithLog: self
]

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>browseVersionsOf: aMethod [
	"Browse all versions of aMethod from my head."
	
	^ (EpLogBrowserModel newWithLog: self)
			addFilter: (EpPluggableFilter isMethod: aMethod);
			refresh;
			openWithSpec
]
