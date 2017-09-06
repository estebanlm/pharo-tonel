"

"
Class {
	#name : #MalSccEdgeDecomposition,
	#superclass : #MalSccExtractor,
	#traits : 'MalTNormalize',
	#classTraits : 'MalTNormalize classTrait',
	#instVars : [
		'bfsp'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccEdgeDecomposition>>bfsPathFrom: startNode to: endNode [
	^ bfsp
		start: startNode;
		end: endNode;
		run
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccEdgeDecomposition>>edgeClass [
	^ MalGraphEdge 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccEdgeDecomposition>>initialize  [
	super initialize.
	bfsp := MalBreadthFirstSearchPath new.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccEdgeDecomposition>>nodeClass [
	^ MalBfsNode 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccEdgeDecomposition>>run [
	bfsp 
		privateNodes: self nodes;
		privateEdges: self edges.
	self edges do: [:e||c|
		c := self 
			bfsPathFrom: e to 
			to: e from.
		self addCircuit: (self normalize: c) ]
]
