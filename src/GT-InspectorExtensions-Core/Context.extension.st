Extension {
	#name : #Context
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Context>>gtInspectorSourceIn: composite [
	<gtInspectorPresentationOrder: 30> 
	(self method gtInspectorSourceIn: composite)
		doItReceiver: [ self receiver ];
		doItContext: [ self ]
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Context>>gtInspectorTempNodes [

	^ (self tempNames withIndexCollect: [ :tempName :tempIndex |
			GTInspectorContextNamedTempNode hostObject: self tempName: tempName tempIndex: tempIndex ]) .
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
Context>>gtInspectorVariableNodesIn: aCollection [
	"We override the variables with context specific ones"
	| tempVariableValueNodes |
	
	tempVariableValueNodes := self gtInspectorTempNodes sort: [:aNode :anotherNode | aNode key < anotherNode key ].
	aCollection addAll: tempVariableValueNodes.
	super gtInspectorVariableNodesIn: aCollection
]
