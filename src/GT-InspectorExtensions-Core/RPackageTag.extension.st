Extension {
	#name : #RPackageTag
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
RPackageTag>>gtInspectorDefinedClassesIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite list
		title: 'Classes';
		display: #classes;
		format: #gtDisplayString
]
