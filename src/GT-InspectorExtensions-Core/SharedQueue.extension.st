Extension {
	#name : #SharedQueue
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
SharedQueue>>gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite fastList
		title: 'Items';
		display: [ items copy ];
		format: [ :each | each gtDisplayString ]
]
