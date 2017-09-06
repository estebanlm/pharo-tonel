Extension {
	#name : #GLMTransmission
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMTransmission>>gtDisplayOn: stream [
	self origins asArray gtDisplayOn: stream.
	stream nextPutAll: '->'.
	self destination gtDisplayOn: stream
]
