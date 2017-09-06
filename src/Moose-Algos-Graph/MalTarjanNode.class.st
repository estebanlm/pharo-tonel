"
Node type used by the MalTarjan algorithm.
Edges are not representated as full objects. We just keep a list of next nodes (following described directed edges).
"
Class {
	#name : #MalTarjanNode,
	#superclass : #MalNodeWithNext,
	#instVars : [
		'index',
		'lowlink',
		'inStack',
		'cycleNodes'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/24/2015 12:33'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>cycleNodes [
	^ cycleNodes
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>cycleNodes: anObject [
	cycleNodes := anObject copy
		remove: self ;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>inStack [
	^ inStack
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>inStack: anObject [
	inStack := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>initialize [
	super initialize.
	nextNodes := Set new.
	index := -1.
	inStack := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>isInCycle [
	^ self cycleNodes isEmpty not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>isTarjanUndefined [
	^ index = -1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>label [
	^ 'T '
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>popped [
	self inStack: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>tarjanIndex [
	^ index
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>tarjanIndex: anInteger [
	index := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>tarjanLowlink [
	^ lowlink
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjanNode>>tarjanLowlink: anInteger [
	lowlink := anInteger
]
