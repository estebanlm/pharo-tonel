"
A basic node able to host the model and to represent edges with no additional class.
Edges are navigable in both way through the nextNodes and prevousNodes instances variables.
"
Class {
	#name : #MalNodeWithPreviousAndNext,
	#superclass : #MalNodeWithNext,
	#instVars : [
		'previousNodes'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/26/2015 12:30'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithPreviousAndNext>>from: sourceNode [
	self previousNodes add: sourceNode 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithPreviousAndNext>>initialize [
	super initialize.
	previousNodes := OrderedCollection new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithPreviousAndNext>>isRoot [
	^ self previousNodes isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithPreviousAndNext>>previousNodes [
	^ previousNodes
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalNodeWithPreviousAndNext>>previousNodes: aNodeList [
	previousNodes := aNodeList
]
