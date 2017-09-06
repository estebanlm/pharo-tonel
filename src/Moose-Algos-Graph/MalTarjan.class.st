"
I implement the well known Tarjan's algorithm. My purpose is to find the strongly connected components (aka circuits /cycles) of a graph in O(m+n).
See https://en.wikipedia.org/wiki/Tarjan%27s_strongly_connected_components_algorithm for more details.
"
Class {
	#name : #MalTarjan,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'stack',
		'runningIndex',
		'sccs'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/23/2015 14:26'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>circuits [
	^ self stronglyConnectedComponents
		select: [ :each | each size > 1 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>findNode: aModel ifAbsent: aBlock [
	^ nodes 
		at: aModel
		ifAbsent: aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>initialize [
	super initialize.
	nodes := Dictionary new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>isRootNode: aTarjanNode [
	^ aTarjanNode tarjanIndex = aTarjanNode tarjanLowlink
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>nodeClass [
	^ MalTarjanNode 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>nodes [
	^ nodes values
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>nodes: aCollection [
	aCollection do: [ :model |
		nodes at: model put: (self nodeClass with: model)
	]
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>nodesAndNextFrom: aNodeList [
	aNodeList 
		do: [ :node | 
				nodes 
					at: node model
					put: (self nodeClass with: node model) ].
	aNodeList 
		do: [ :node |
			node nextNodes 
				do: [ :each |
						(self findNode: node model) 
							to: (self findNode: each model) ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>popStackAndUpdateCurrentScc: aComponent until: aTarjanNode [
	| currentNode |
	[ currentNode := stack pop.
	currentNode popped.
	aComponent add: currentNode ] 
		doWhileFalse: [ currentNode = aTarjanNode ].
	sccs add: aComponent.
	aComponent do: [ :each | each cycleNodes: aComponent ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>putOnStack: aTarjanNode [
	stack push: aTarjanNode.
	aTarjanNode inStack: true. "I use a flag to avoid stack access"
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>run [
	sccs := OrderedCollection new.
	stack := Stack new.
	runningIndex := 0.
	self nodes
		do: [ :n | 
			n isTarjanUndefined
				ifTrue: [ self traverse: n ] ].
	^ sccs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>stronglyConnectedComponents [
	^ sccs ifNil: [ self run ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>traverse: aTarjanNode [
	| component |
	aTarjanNode tarjanIndex: runningIndex.
	aTarjanNode tarjanLowlink: runningIndex.
	runningIndex := runningIndex + 1.
	self putOnStack: aTarjanNode.
	self traverseChildrenOf: aTarjanNode.
	(self isRootNode: aTarjanNode)
		ifTrue: [ component := OrderedCollection new.	"start new SCC"
					self popStackAndUpdateCurrentScc: component until: aTarjanNode ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTarjan>>traverseChildrenOf: aTarjanNode [
	aTarjanNode nextNodes
		do: [ :next | 
			next isTarjanUndefined
				ifTrue: [ self traverse: next.
							aTarjanNode tarjanLowlink: (aTarjanNode tarjanLowlink min: next tarjanLowlink) ]
				ifFalse: [ next inStack
								ifTrue: [ aTarjanNode tarjanLowlink: (aTarjanNode tarjanLowlink min: next tarjanIndex) ] ] ]
]
