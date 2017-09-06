Extension {
	#name : #GLMPane
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPane>>gtInspectorPortsIn: composite [
	<gtInspectorPresentationOrder: 30>
	^ composite table
		title: 'Ports';
		display: [ self ports ];
		column: 'Port' evaluated: [ :each | each name ];
		column: 'Value' evaluated: [ :each | each value asString ]
]
