"

"
Class {
	#name : #MalWeightedHits,
	#superclass : #MalHits,
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedHits>>computeAuthoritiesFor: aNode [

	aNode auth: (aNode previousEdges inject: 0 into: [:s :e| s + (e weight * e from hub)])
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedHits>>computeHubsFor: aNode [

	aNode hub: (aNode nextEdges inject: 0 into: [:s :e| s + (e weight * e to auth)])
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedHits>>edgeClass [

	^ MalWeightedEdge
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedHits>>nodeClass [

	^ MalWeightedHitsNode 
]
