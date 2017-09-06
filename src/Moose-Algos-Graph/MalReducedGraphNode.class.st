"
Node used by the MalReducedGraph algorithm.
It has an additional instance variable to track merged nodes.
"
Class {
	#name : #MalReducedGraphNode,
	#superclass : #MalNodeWithPreviousAndNext,
	#instVars : [
		'mergedNodes'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/23/2015 17:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalReducedGraphNode>>label [
	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalReducedGraphNode>>mergedNodes [
	^ mergedNodes
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalReducedGraphNode>>mergedNodes: aNodeList [
	mergedNodes := aNodeList
]
