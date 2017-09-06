Extension {
	#name : #ZnRequest
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ZnRequest>>gtInspectorRequestIn: composite [
	<gtInspectorPresentationOrder: 25>
	(self requestLine gtInspectorTextIn: composite)
		title: 'Request'
]
