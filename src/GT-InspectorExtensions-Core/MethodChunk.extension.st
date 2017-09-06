Extension {
	#name : #MethodChunk
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MethodChunk>>gtDisplayOn: stream [
	stream nextPutAll: self description
]
