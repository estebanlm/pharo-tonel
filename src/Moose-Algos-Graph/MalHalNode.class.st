"

"
Class {
	#name : #MalHalNode,
	#superclass : #MalTarjanNode,
	#instVars : [
		'hNumber',
		'previousNodes'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>from: aHalNode [
	previousNodes add: aHalNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>hNumber [
	^ hNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>hNumber: anObject [
	hNumber := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>initialize [
	super initialize.
	previousNodes := Set new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>isSink [

	^ self nextNodes isEmpty 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>isSource [

	^ self previousNodes isEmpty 
]

{
	#category : #hal-algorithm,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>label [

	^ 'Ha '
]

{
	#category : #hal-algorithm,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>markCycleWith: anInteger [

	self cycleNodes do: [ :next | next hNumber: anInteger ].
	^ self cycleNodes 
]

{
	#category : #hal-algorithm,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>markHNumber: anInteger [

	self hNumber: anInteger.
	self isInCycle ifTrue: [
		^ self markCycleWith: anInteger
	].
	^ OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>previousNodes [
	^ previousNodes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>previousNodes: anObject [
	previousNodes := anObject
]

{
	#category : #hal-algorithm,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>removeCycleFromEdges [

	self nextNodes removeAllFoundIn: self cycleNodes.
	self previousNodes removeAllFoundIn: self cycleNodes 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHalNode>>to: aNode [
	super to: aNode.
	aNode previousNodes add: self
]
