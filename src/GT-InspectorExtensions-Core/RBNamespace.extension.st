Extension {
	#name : #RBNamespace
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
RBNamespace>>gtInspectorPreviewIn: composite [
	<gtInspectorPresentationOrder: 0>
	self changes isNil ifTrue: [ ^ self ].
	self changes gtInspectorPreviewIn: composite
]
