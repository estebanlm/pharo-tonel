Extension {
	#name : #NewValueHolder
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
NewValueHolder>>gtAnnouncer [
	^ announcer
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
NewValueHolder>>gtInspectorPresentationsIn: composite inContext: aGTInspector [
	composite 
		updateOn: Announcement from: announcer.
	super gtInspectorPresentationsIn: composite inContext: aGTInspector
]
