"

"
Class {
	#name : #MalDisjointSets,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'components'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSets>>components [

	^ (components keys collect: [:parent| 
		(components at: parent) collect: [:n| n model] ]) asOrderedCollection 
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSets>>nodeClass [

	^ MalDisjointSetsNextNode 
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalDisjointSets>>run [

	"partition nodes by connectivity"
	self nodes do: [:n|
		n nextNodes do: [:next | 
			n union: next ]].
	components := Dictionary new.
	self nodes inject: components into: [:d :n |
		(d at: n find ifAbsentPut: [OrderedCollection new]) add: n. d ]
]
