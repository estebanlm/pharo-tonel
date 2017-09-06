"

"
Class {
	#name : #MalCyclesCoverage,
	#superclass : #MalTarjan,
	#traits : 'MalTNormalize',
	#classTraits : 'MalTNormalize classTrait',
	#instVars : [
		'circuits',
		'sccExtractorClass'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCyclesCoverage>>circuits [
	^ circuits
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCyclesCoverage>>directCircuit: aCollection [

	^ self normalize: (OrderedCollection 
		with: aCollection first model 
		with: aCollection second model)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCyclesCoverage>>initialize [

	super initialize.
	self useNodeDecomposition 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCyclesCoverage>>retrieveCircuitsFromSccExtractor: sccExtractor [

	sccExtractor circuits do: [:c |
		circuits add: (c collect: [:n| n model]) ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCyclesCoverage>>run [

	super run.
	circuits := OrderedCollection new.
	self stronglyConnectedComponents do: [:scc|
		(scc size > 2) ifTrue: [|sccExtractor|
			sccExtractor := sccExtractorClass new.
			sccExtractor nodes: scc.
			"graph injection remove outgoing edges from SCC"
			sccExtractor edges: scc from: #yourself toAll: #nextNodes.
			sccExtractor run.
			self retrieveCircuitsFromSccExtractor: sccExtractor ].
		(scc size = 2) ifTrue: [
			circuits add: (self directCircuit: scc) ]. "direct circuit"
		]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCyclesCoverage>>useCircuitSpan [

	sccExtractorClass := MalCircuitSpanningEdges  
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCyclesCoverage>>useEdgeDecomposition [

	sccExtractorClass := MalSccEdgeDecomposition 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalCyclesCoverage>>useNodeDecomposition [

	sccExtractorClass := MalSccNodeDecomposition 
]
