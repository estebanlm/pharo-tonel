Extension {
	#name : #MetacelloSpec
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MetacelloSpec>>gtInspectorCodeIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite pharoScript 
		title: 'Code';
		display: [ 
			String streamContents: [ :s | self configMethodOn: s indent: 0] ]

]
