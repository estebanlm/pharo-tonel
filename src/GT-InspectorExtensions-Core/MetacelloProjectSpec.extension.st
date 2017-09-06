Extension {
	#name : #MetacelloProjectSpec
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MetacelloProjectSpec>>gtInspectorPackagesIn: composite [
	<gtInspectorPresentationOrder: 40>
	self version gtInspectorPackagesIn: composite
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MetacelloProjectSpec>>gtInspectorProjectsIn: composite [
	<gtInspectorPresentationOrder: 40>
	self version gtInspectorProjectsIn: composite
]
