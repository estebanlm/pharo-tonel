"

"
Class {
	#name : #MalBfsNode,
	#superclass : #MalGraphNode,
	#traits : 'MalTEdgeNode - {#previousEdges. #from:edge:}',
	#classTraits : 'MalTEdgeNode classTrait',
	#instVars : [
		'nextEdges',
		'firstDepth'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBfsNode>>firstDepth [
	^ firstDepth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBfsNode>>firstDepth: anObject [
	firstDepth := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBfsNode>>initialize  [

	nextEdges := OrderedCollection new.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBfsNode>>nextEdges [

	^ nextEdges 
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBfsNode>>notVisited [

	firstDepth := nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBfsNode>>visited [

	^ firstDepth notNil
]
