Extension {
	#name : #GLMBrowser
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMBrowser>>gtInspectorTransmissionsIn: composite [
	<gtInspectorPresentationOrder: 35>  
	^ composite list 
		title: 'Transmissions';
		display: [ self transmissions ]
]
