"
Breadth-first search (BFS) is an algorithm for traversing or searching tree or graph data structures. It starts at the tree root (or some arbitrary node of a graph, sometimes referred to as a `search key') and explores the neighbor nodes first, before moving to the next level neighbours. (source: Wikipedia)
"
Class {
	#name : #MalBreadthFirstSearchPath,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'start',
		'end',
		'fifo'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/26/2015 14:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>edgeClass [

	^ MalGraphEdge 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>end [
	^ end
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>end: aDijsktraNode [
	end := aDijsktraNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>nodeClass [

	^ MalBfsNode 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>run [
	
	| path |
	fifo := OrderedCollection withAll: start nextEdges.
	start firstDepth: 0.
	path := self run: 1.
	start notVisited .
	^ path
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>run: depth [
	| edge path next |
	edge := fifo removeFirst.
	next := edge to.
	^ next = end
		ifTrue: [ OrderedCollection with: edge from model with: end model ]
		ifFalse:
			[ next visited
				ifFalse:
					[ fifo addAll: next nextEdges.
					next firstDepth: depth ].	"only add edges if node not already visited (avoid cycles on the path)"
			path := self run: depth + 1.	"continue recursion"
			(depth = next firstDepth) "out of stack"
				ifTrue: [
					(path first = next model) "backtrack along the path"
						ifTrue: [ path addFirst: edge from model ].	
					"reset visited for next run"
					next notVisited ].
			path ]	"stop recursion, start backtrack"
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>runFrom: startModel to: endModel [
	self
		start: (self findNode: startModel);
		end: (self findNode: endModel).
	^ self run
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>start [
	^ start
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalBreadthFirstSearchPath>>start: aDijsktraNode [
	start := aDijsktraNode.

]
