"

"
Class {
	#name : #MalHits,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'k'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>computeAuthoritiesFor: aNode [

	aNode auth: (aNode previousNodes inject: 0 into: [:s :n| s + n hub])
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>computeHubsFor: aNode [

	aNode hub: (aNode nextNodes inject: 0 into: [:s :n| s + n auth])
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>initialize [

	super initialize.
	k := 20
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>initializeNodes [

	self nodes do: [:n|
		n auth: 1.0; hub: 1.0
	]
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>k [
	^ k
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>k: anObject [
	k := anObject
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>nodeClass [

	^ MalHitsNode
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>normalize: aCollectionOfNodes [

	| authNorm hubNorm |
	authNorm := aCollectionOfNodes inject: 0 into: [:s :n| s + n auth].
	hubNorm := aCollectionOfNodes inject: 0 into: [:s :n| s + n hub].
	authNorm = 0 ifTrue: [authNorm := 1].
	hubNorm = 0 ifTrue: [hubNorm := 1].
	aCollectionOfNodes do: [:n|
		n auth: (n auth / authNorm).
		n hub: (n hub / hubNorm)]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHits>>run [

	|i|
	i := 1.
	self initializeNodes.
	[i = k] whileFalse: [
		self nodes do: [:n|
			self computeAuthoritiesFor: n].
		self nodes do: [:n|
			self computeHubsFor: n].
		self normalize: self nodes.
"		Transcript cr; show: i; show: ': '.
		self nodes do: [:n|
			Transcript show: n printString]."
	i := i + 1]
]
