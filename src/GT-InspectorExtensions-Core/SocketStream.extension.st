Extension {
	#name : #SocketStream
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
SocketStream>>gtInspectorSocketInfo: composite [
	<gtInspectorPresentationOrder: 5>
	^ self socket ifNotNil: [ :aSocket | aSocket gtInspectorSocketInfo: composite ]
]
