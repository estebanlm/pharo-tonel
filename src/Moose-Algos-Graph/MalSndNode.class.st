"

"
Class {
	#name : #MalSndNode,
	#superclass : #MalNodeWithPreviousAndNext,
	#instVars : [
		'visited',
		'bfsAncestor'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSndNode>>bfsAncestor [
	^ bfsAncestor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSndNode>>bfsAncestor: anObject [
	bfsAncestor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSndNode>>visited [
	^ visited
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSndNode>>visited: anObject [
	visited := anObject
]
