Extension {
	#name : #Form
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Form>>gtInspectorFormIn: composite [
	<gtInspectorPresentationOrder: 90>  
	^ composite morph 
		title: 'Morph';
		display: [ self asMorph ]
]
