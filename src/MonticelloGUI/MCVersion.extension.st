Extension {
	#name : #MCVersion
}

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersion>>browse [

	^ (MCSnapshotBrowser forSnapshot: self completeSnapshot)
		showLabelled: 'Snapshot of ', self fileName
]

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersion>>open [
	(MCVersionInspector new version: self) show
]
