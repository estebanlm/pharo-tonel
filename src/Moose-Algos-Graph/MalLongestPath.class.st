"
A MalLongestPath is the implementation of the longest path algo.
This is working only on graph not weighted and without circuits

See tests for more informations

"
Class {
	#name : #MalLongestPath,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'previousRanks',
		'currentRank',
		'rootNodes',
		'leafNodes',
		'maxIterations'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'VincentBlondeau 7/25/2014 15:48'
}

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>computeLeafNodes [
	self leafNodes: (self nodes select: [ :node | node nextEdges isEmpty ])
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>computeRootNodes [
	self rootNodes: (self nodes select: [ :node | node previousEdges isEmpty ])
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>computeStep [
	| nodesToManage |
	self isCompleted
		ifFalse: [ 
			currentRank := OrderedCollection new.
			nodesToManage := self nodes reject: [ :node | previousRanks includes: node ].
			nodesToManage
				do: [ :node | 
					(previousRanks includesAll: node previousNodes)
						ifTrue: [ 
							currentRank add: node.
							node pathWeight: (node previousNodes max: [ :maxNode | maxNode pathWeight ]) + 1 ] ].
			previousRanks addAll: currentRank.
			maxIterations := maxIterations -1.
			self computeStep ]
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>edgeClass [
	^ MalGraphEdge
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>initialize [
	super initialize.
	previousRanks := OrderedCollection new
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>initializeRootNodes [
	self computeRootNodes.
	self setRanks: self rootNodes at: 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>isCompleted [
	maxIterations = 0
		ifTrue: [ self error: 'Algorithm should be finished by now...'.
			^ true ].
	^ (self leafNodes anySatisfy: [ :node | node pathWeight = Float infinity ]) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>leafNodes [
	^ leafNodes
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>leafNodes: aCollectionOfNodes [
	leafNodes := aCollectionOfNodes
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>nodeClass [
	^ MalDijkstraNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>rootNodes [
	^ rootNodes 
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>rootNodes: aCollectionOfNodes [
	rootNodes := aCollectionOfNodes 
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>run [
	self initializeRootNodes.
	self computeLeafNodes.
	previousRanks addAll: self rootNodes.
	maxIterations := self nodes size + 20.
	self computeStep
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalLongestPath>>setRanks: collectionOfNodes at: aRank [
	collectionOfNodes do: [ :aNode | aNode pathWeight: aRank ]
	
]
