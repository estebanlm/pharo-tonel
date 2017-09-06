Extension {
	#name : #WindowModel
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
WindowModel>>gtInspectorModelNestingIn: composite [
	self model gtInspectorModelNestingIn: composite
]
