"
Default representation of a graph vertice (node).
"
Class {
	#name : #MalGraphNode,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/23/2015 13:46'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode class>>with: aModel [

	^ self new model: aModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode>>from: sourceNode [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode>>from: sourceNode edge: anEdge [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode>>label [

	^ 'N '
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode>>model: aModel [

	model := aModel
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode>>printOn: stream [

	stream 
		nextPutAll: self label.
	model printOn: stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode>>to: targetNode [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphNode>>to: targetNode edge: anEdge [

]
