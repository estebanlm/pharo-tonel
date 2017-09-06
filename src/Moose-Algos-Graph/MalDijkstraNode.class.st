"

"
Class {
	#name : #MalDijkstraNode,
	#superclass : #MalGraphNode,
	#traits : 'MalTEdgeNode',
	#classTraits : 'MalTEdgeNode classTrait',
	#instVars : [
		'pathWeight',
		'previousEdges',
		'nextEdges',
		'previousNodes'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraNode>>from: aNode edge: anEdge [

	self previousNodes add: aNode.
	self previousEdges add: anEdge
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraNode>>initialize [

	previousNodes := OrderedCollection new.
	previousEdges := OrderedCollection new.
	nextEdges := OrderedCollection new.
	pathWeight := Float infinity "initialization for Dijsktra"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraNode>>nextEdges [

	^ nextEdges
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraNode>>pathWeight [
	^ pathWeight
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraNode>>pathWeight: anObject [
	pathWeight := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraNode>>previousEdges [

	^ previousEdges
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraNode>>previousNodes [

	^ previousNodes
]
