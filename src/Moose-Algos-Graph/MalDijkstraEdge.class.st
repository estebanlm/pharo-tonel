"

"
Class {
	#name : #MalDijkstraEdge,
	#superclass : #MalWeightedEdge,
	#instVars : [
		'visited'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraEdge>>initialize  [

	super initialize.
	weight := 1.
	visited := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraEdge>>isVisited [

	^ visited
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDijkstraEdge>>visited: aBoolean [

	visited := aBoolean 
]
