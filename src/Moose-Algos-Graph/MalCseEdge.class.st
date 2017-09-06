"

"
Class {
	#name : #MalCseEdge,
	#superclass : #MalDijkstraEdge,
	#instVars : [
		'cseVisited'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCseEdge>>cseVisited [
	^ cseVisited
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCseEdge>>cseVisited: aBoolean [
	cseVisited := aBoolean
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCseEdge>>initialize  [

	super initialize.
	self cseVisited: false.
]
