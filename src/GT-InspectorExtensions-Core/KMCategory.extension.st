Extension {
	#name : #KMCategory
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
KMCategory>>gtDisplayOn: stream [
	super gtDisplayOn: stream.
	^ stream
		nextPut: $(;
		nextPutAll: self name asString;
		nextPut: $)
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
KMCategory>>gtInspectorMappingsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list
		title: 'Keys';
		display: [ self allEntries keymaps ];
		filterOn: [ :text :each | each gtDisplayString includesSubstring: text caseSensitive: false ];
		format: #gtDisplayString;
		when: [ self allEntries keymaps notEmpty ]
]
