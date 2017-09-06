Extension {
	#name : #String
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
String>>gtDisplayOn: aStream [
	self printOn: aStream.
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
String>>gtInspectorTextIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite text
		title: 'String';
		display: [ self truncateWithElipsisTo: 100000 ]
]
