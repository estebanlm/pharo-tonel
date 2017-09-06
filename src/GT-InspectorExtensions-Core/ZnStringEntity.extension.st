Extension {
	#name : #ZnStringEntity
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ZnStringEntity>>gtInspectorTextIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite text
		title: 'Contents';
		format: self string
]
