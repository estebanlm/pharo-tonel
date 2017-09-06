"
A basic node able to host the model and to represent edges with no additional class.
Edges are navigable in one way through the nextNodes instance variable.
"
Class {
	#name : #MalNodeWithNext,
	#superclass : #MalGraphNode,
	#instVars : [
		'nextNodes'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/26/2015 11:49'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithNext>>initialize [
	super initialize.
	nextNodes := OrderedCollection new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithNext>>isLeaf [
	^ self nextNodes isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithNext>>nextNodes [
	^ nextNodes
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithNext>>nextNodes: aNodeList [
	nextNodes := aNodeList
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithNext>>to: targetNode [
	self nextNodes add: targetNode 
]
