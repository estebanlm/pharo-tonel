"

"
Class {
	#name : #MalWeightedHitsNode,
	#superclass : #MalHitsNode,
	#traits : 'MalTEdgeNode',
	#classTraits : 'MalTEdgeNode classTrait',
	#instVars : [
		'nextEdges',
		'previousEdges'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedHitsNode>>label [

	^ 'WH '
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedHitsNode>>nextEdges [

	^ nextEdges
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedHitsNode>>previousEdges [

	^ previousEdges
]
