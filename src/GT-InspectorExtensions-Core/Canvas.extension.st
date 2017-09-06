Extension {
	#name : #Canvas
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Canvas>>gtInspectorFormIn: composite [
	<gtInspectorPresentationOrder: 40>
	^ self form gtInspectorFormIn: composite 
]
