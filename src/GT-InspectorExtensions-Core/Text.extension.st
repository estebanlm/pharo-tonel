Extension {
	#name : #Text
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Text>>gtInspectorItemsIn: composite [
	"No items presentation for a Text"
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Text>>gtInspectorTextIn: composite [
	<gtInspectorPresentationOrder: -10>  
	 composite text
		title: 'Text';
		format: self
]
