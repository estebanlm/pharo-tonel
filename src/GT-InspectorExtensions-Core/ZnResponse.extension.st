Extension {
	#name : #ZnResponse
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ZnResponse>>gtInspectorResponseIn: composite [
	<gtInspectorPresentationOrder: 25>
	(self statusLine gtInspectorTextIn: composite)
		title: 'Response'
]
