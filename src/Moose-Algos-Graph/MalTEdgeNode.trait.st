"

"
Trait {
	#name : #MalTEdgeNode,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTEdgeNode>>from: aNode edge: anEdge [

	self previousEdges add: anEdge
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTEdgeNode>>nextEdges [

	self explicitRequirement
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTEdgeNode>>previousEdges [

	self explicitRequirement
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTEdgeNode>>to: aNode edge: anEdge [

	self nextEdges add: anEdge
]
