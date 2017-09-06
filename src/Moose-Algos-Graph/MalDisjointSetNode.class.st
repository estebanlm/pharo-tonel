"

"
Class {
	#name : #MalDisjointSetNode,
	#superclass : #MalGraphNode,
	#instVars : [
		'parent'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetNode>>find [

	^ (self = parent) ifTrue: [ self ]
					ifFalse: [ parent find ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetNode>>label [

	^ 'DSN '
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetNode>>makeSet [

	parent := self
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetNode>>parent [
	^ parent
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetNode>>parent: anObject [
	parent := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetNode>>union: aDSNode [

	aDSNode find parent: self find
]
