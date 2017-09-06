"

"
Class {
	#name : #MalDominanceNode,
	#superclass : #MalDisjointSetNode,
	#instVars : [
		'previousNodes',
		'uniqueSource'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>dominantNode [

	^ self find
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>firstSource [

	^ previousNodes first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>flagUnique [

	uniqueSource := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>from: sourceNode [

	previousNodes add: sourceNode 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>hasUniqueSource [
	^ self previousNodes size = 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>initialize [

	previousNodes := OrderedCollection new.
	uniqueSource := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>isDominant [
	"A node is dominant if it has been flagged as the unique Source by one of its target
	 AND it is its own parent in the partition"
	^ uniqueSource and: [self find = self]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>isDominated [

	^ self isDominant not and: [self find isDominant]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>label [

	^ 'Dm '
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominanceNode>>previousNodes [
	^ previousNodes
]
