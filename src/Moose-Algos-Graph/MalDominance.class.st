"

"
Class {
	#name : #MalDominance,
	#superclass : #MalGraphAlgorithm,
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominance>>nodeClass [

	^ MalDominanceNode
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDominance>>run [

	| source |
	self nodes do: [ :n | n makeSet ].
	self nodes do: [ :n | n hasUniqueSource ifTrue: [ 
								source := n firstSource.
								source flagUnique.
								source union: n ] ]
]
