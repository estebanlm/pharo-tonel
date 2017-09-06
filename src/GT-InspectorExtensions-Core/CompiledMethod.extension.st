Extension {
	#name : #CompiledMethod
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
CompiledMethod>>gtDisplayOn: aStream [
	aStream print: self methodClass; nextPutAll: '>>'; store: self selector.
]
