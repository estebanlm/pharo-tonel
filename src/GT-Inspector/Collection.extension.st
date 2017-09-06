Extension {
	#name : #Collection
}

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Collection>>gtInspectorHash [

	^ super gtInspectorHash bitXor: self size hash
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Collection>>gtInspectorInterestingObject [
	^ self size = 1
		ifTrue: [ self anyOne ]
		ifFalse: [ self ]
]
