"
I'm the common superclass for all Graphes related algorithms.
I store edges and nodes and provides convenience methods to add, access and find nodes or edges.

Once configured, send the run message to execute the algorithm.
"
Class {
	#name : #MalGraphAlgorithm,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/24/2015 09:53'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>addEdge: eModel from: source to: target  [

	| edge sourceNode targetNode unknownNode |
	unknownNode := false.
	sourceNode := self 	findNode: (source value: eModel)
							ifAbsent: [ unknownNode := true ].
	targetNode := self 	findNode: (target value: eModel)
							ifAbsent: [ unknownNode := true ].

	unknownNode ifFalse: [
		self edgeClass ifNil: [
			sourceNode to: targetNode.
			targetNode from: sourceNode.
			^ nil
		] ifNotNil: [
			edge := self edgeClass with: eModel.
			sourceNode to: targetNode edge: edge.
			targetNode from: sourceNode edge: edge.
			edge from: sourceNode.
			edge to: targetNode.
			self edges add: edge.	
			^ edge
		]		
	].
	^ nil
]

{
	#category : #'building - graph',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>addNodeFor: aModel [
	^ self 
		findNode: aModel
		ifAbsent: [ nodes add: (self nodeClass with: aModel) ]
]

{
	#category : #'building - graph',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>addNodesFrom: model childrenBlock: childrenBlock [
	"recursively add nodes from the model"
	| parent |
	model ifNil: [ ^ self ].

	self
		findNode: model
		ifFound: [ ^ self "Prevent cycles. Do not add a node already added." ].

	parent := self addNodeFor: model.
	(childrenBlock value: model)
		do: [ :child | 
				self addNodesFrom: child childrenBlock: childrenBlock.
				self addEdge: { parent model . child } from: #first to: #second ]
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>edgeClass [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>edges [
	^ edges
]

{
	#category : #'building - graph',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>edges: aCollection from: source to: target [
	aCollection 
		do: [ :eModel |	self addEdge: eModel from: source to: target ]
]

{
	#category : #'building - graph',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>edges: aCollection from: source to: target weight: weightFunction [
	| edge |
	aCollection 
		do: [ :eModel |
			edge := self addEdge: eModel from: source to: target.
			edge ifNotNil: [edge weight: (weightFunction value: eModel)] ]
]

{
	#category : #'building - graph',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>edges: aCollection from: source toAll: targets [
	aCollection 
		do: [ :eModel |
			(targets value: eModel) 
			do: [:target| 
					self 
						addEdge: {source value: eModel . target}
						from: #first
						to: #second ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>findEdge: aModel [
	^ self edges detect: [:edge | edge model = aModel]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>findNode: aModel [
	^ self nodes detect: [:aNode | aNode model = aModel ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>findNode: aModel ifAbsent: aBlock [
	^ self nodes 
		detect: [:node | node model = aModel]
		ifNone: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>findNode: aModel ifFound: aBlock [
	^ self nodes 
		detect: [:node | node model = aModel]
		ifFound: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>graph [
	^ {self nodes . self edges}
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>initialize [
	nodes := OrderedCollection new.
	edges := OrderedCollection new.
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>nodeClass [
	^ MalGraphNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>nodes [
	^ nodes
]

{
	#category : #'building - graph',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>nodes: aNodeList [
	aNodeList 
		do: [ :model |	self addNodeFor: model ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>privateEdges: aCollection [

	edges := aCollection 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>privateNodes: aCollection [

	nodes := aCollection 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphAlgorithm>>run [

	self subclassResponsibility 
]
