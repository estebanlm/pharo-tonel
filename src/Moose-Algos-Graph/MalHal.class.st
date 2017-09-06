"

"
Class {
	#name : #MalHal,
	#superclass : #MalTarjan,
	#instVars : [
		'nodesToVisit'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHal>>hierarchyLevels [
	| map level |
	map := Dictionary new.
	self nodes do: [ :node | 
		level := map 
			at: node hNumber 
			ifAbsentPut: [OrderedCollection new].
		level add: node
	].
	^ map
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHal>>initializeHal [
	| entryNodes |
	nodesToVisit := OrderedCollection new.
	self nodes do: #removeCycleFromEdges.
	entryNodes := self nodes select: #isSource.
	entryNodes do: [ :n | n hNumber: 0 ].
	nodesToVisit addAll: entryNodes
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHal>>mainLoop [
	| cnode touchedCycle |
	[ nodesToVisit isEmpty ]
		whileFalse: [ 
			cnode := nodesToVisit removeFirst.
			cnode nextNodes
				do: [ :next | 
					touchedCycle := next markHNumber: cnode hNumber + 1.
					nodesToVisit addAll: touchedCycle ].
			nodesToVisit addAll: cnode nextNodes ]
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHal>>nodeClass [
	^ MalHalNode
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHal>>run [
	self runTarjan.
	self initializeHal.
	self mainLoop
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHal>>runTarjan [
	super run
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHal>>showLevels [

	self hierarchyLevels keysAndValuesDo: [ :k :v |
			Transcript show: k.
			v do: [ :n | Transcript show: ' ' ; show: n ].
			Transcript cr
		]
]
