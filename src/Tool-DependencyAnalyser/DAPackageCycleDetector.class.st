"
I'm able to detect all the cycles in a package dependency graph.

Analysis is done in three steps: build the dependency graph, isolating the strongly connected components (SCC), and for each SCC detect all the elementary cycles.

Use the message runAlgorithm to run the algorithm to retrieve the elementary cycles in the package dependency graph.

 At the end, all the cycles are in the collection ""cycles"".
"
Class {
	#name : #DAPackageCycleDetector,
	#superclass : #Object,
	#instVars : [
		'sccs',
		'cycles',
		'visitedNodes',
		'queue',
		'relationGraph'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 14:26'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector class>>collections [
	^ (self onPackagesNamed: #('Collections-Abstract' 'Collections-Arithmetic' 'Collections-Arrayed' 'Collections-Atomic' 'Collections-Native' 'Collections-Sequenceable' 'Collections-Stack' 'Collections-Streams' 'Collections-Strings' 'Collections-Support' 'Collections-Traits' 'Collections-Unordered' 'Collections-Weak')) runAlgorithm.
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector class>>morphic [
	^ (self onPackagesNamed: #('Morphic-Base' 'Morphic-Core' 'Morphic-Examples' 'MorphicTests' 'Spec-MorphicAdapters')) runAlgorithm.
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector class>>new [
	^ self onPackagesNamed: #()
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector class>>onPackages: aCollection [
	^ self basicNew 
		initializeWithRPackageSet: aCollection;
		yourself
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector class>>onPackagesNamed: aCollection [
	^ self onPackages: (aCollection collect: [ :each | RPackageSet named: each ])
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector class>>system [
	^ (self onPackagesNamed: 
		(RPackageOrganizer default packages collect: [ :package | package packageName asString ])) 			runAlgorithm.
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>addCycle: aPDPackageCycle [
	cycles add: aPDPackageCycle
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>addVisitedNodes: aNode  [
	visitedNodes add: aNode
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>buildCycleUntil: children [
	| aPackageCycle currentNode |
	aPackageCycle := DAPackageCycle new.
	currentNode := children.
	[ currentNode isNil ]
		whileFalse: [ 
			aPackageCycle addPackage: currentNode.
			currentNode := currentNode bfsParent ].
	(self cycleAlreadyFound: aPackageCycle)
		ifFalse: [ 
			aPackageCycle reversedCycle.
			self addCycle: aPackageCycle ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>childrensFrom: stronglyConnectedComponents for: aNode [
	^ stronglyConnectedComponents successors: aNode
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>cycleAlreadyFound: aPackageCycle [
	^ cycles anySatisfy: [ :cycle | cycle = aPackageCycle ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>cycles [
	^ cycles sorted: [ :a :b | a size < b size ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>cycles: anObject [
	cycles := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>cyclesWith: aPDPackage [
	^ cycles select: [ :cycle |
			cycle isInCycle: aPDPackage
		 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>cyclesWithAtLeast: aCollectionOfPDPackage [
	^ cycles select: [ :cycle | cycle isAtLeastInCycle: aCollectionOfPDPackage ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>dequeue [
	| aNode |
	aNode := queue nextOrNil.
	aNode ifNotNil: [ aNode inStack: false ].
	^ aNode
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>enqueue: aNode [
	queue nextPut: aNode
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>findAllCyclesFrom: stronglyConnectedComponents for: package [
	| parents |
	self initializeVisitedNodes.
	parents := self parentsFrom: stronglyConnectedComponents For: package.
	self initializeQueueWith: package.
	 [ parents isEmpty ] whileFalse: [ self startBfsFrom: stronglyConnectedComponents For: parents ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>findCycles: stronglyConnectedComponents [
	stronglyConnectedComponents packages
		do: [ :package | 
			self findAllCyclesFrom: stronglyConnectedComponents for: package 
			]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>initialize [
	super initialize.
	cycles := SortedCollection new.
	sccs := OrderedCollection new.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>initializeQueueWith: package [

	package bfsParent: nil.	
	package inStack: true.
	queue := WaitfreeQueue new.
	queue nextPut: package
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>initializeVisitedNodes [
	
	visitedNodes := Set new.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>initializeWithRPackageSet: aCollection [
	relationGraph := DAPackageRelationGraph onPackages: (aCollection collect: [ :each | DAPackage on: each ]).
	cycles := OrderedCollection new.
	self relationGraph build.
	sccs := DATarjanAlgorithm new
		run: self relationGraph;
		stronglyConnectedComponents
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>isVisitedOrInQueue: aNode [
	^ (visitedNodes includes: aNode) or: [ aNode isInStack ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>parentsFrom: stronglyConnectedComponents For: aNode [
	^ stronglyConnectedComponents predecessors: aNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>refresh [
	self relationGraph refreshGraph.
	self 
		reset;
		runAlgorithm.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>relationGraph [
	^ relationGraph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>reset [
	cycles := SortedCollection new.
	visitedNodes := nil.
	queue := nil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>runAlgorithm [
	self stronglyConnectedComponents
		do: [ :scc | self findCycles: scc ]
		displayingProgress: 'finding cycles'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>startBfsFrom: stronglyConnectedComponents For: parents [
	| dequeue childrens |
	dequeue := self dequeue.
	childrens := self childrensFrom: stronglyConnectedComponents for: dequeue.
	childrens
		do: [ :children | 
			(self isVisitedOrInQueue: children)
				ifFalse: [ 
					children bfsParent: dequeue.
					self enqueue: children ].
			(parents includes: children)
				ifTrue: [ 
					self buildCycleUntil: children.
					parents remove: children ] ].
	self addVisitedNodes: dequeue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>stronglyConnectedComponents [
	^ sccs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetector>>visitedNodes [
	^ visitedNodes
]
