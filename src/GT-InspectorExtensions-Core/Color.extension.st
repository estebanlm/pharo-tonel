Extension {
	#name : #Color
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Color>>gtInspectorColorIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite morph 
		title: 'Color';
		display: [ BorderedMorph new color: self ]
]
