Extension {
	#name : #KMKeymap
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
KMKeymap>>gtDisplayOn: aStream [
	aStream 
		nextPutAll: self name gtDisplayString;
		nextPutAll: ' on ';
		nextPutAll: self shortcut gtDisplayString;
		nextPutAll: ' do ' ;
		nextPutAll: self action gtDisplayString
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
KMKeymap>>gtInspectorSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 30> 

	^ self action gtInspectorSourceCodeIn: composite
]
