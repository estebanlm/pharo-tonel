"

"
Class {
	#name : #MalDisjointSetsNextNode,
	#superclass : #MalDisjointSetNode,
	#instVars : [
		'nextNodes'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetsNextNode>>initialize [

	self flag: #refactor.
	self makeSet. "should be called in super initialize"
	nextNodes := OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetsNextNode>>nextNodes [

	^ nextNodes 
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSetsNextNode>>to: targetNode [
	self nextNodes add: targetNode
]
