Extension {
	#name : #ZnHeaders
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
ZnHeaders>>gtInspectorHeadersIn: composite  [
	<gtInspectorPresentationOrder: 30>
	^ (self headers gtInspectorItemsIn: composite) 
		display: [ :anObject | self headers associations ];
		title: [ :anObject | self headers size asString , ' items' ]
]
