Extension {
	#name : #AbstractMorphicAdapter
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
AbstractMorphicAdapter>>gtInspectorPreviewIn: composite [
	<gtInspectorPresentationOrder: 30>
	
	self widgetDo: [ :w | w gtInspectorMorphIn: composite ]
]
