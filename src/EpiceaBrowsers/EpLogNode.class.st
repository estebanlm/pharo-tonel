"
I am a node in a tree of Epicea logs, in a particular refresh of the browser. The nodes of such tree are Epicea files and an edge between a node A and another B exist when A contains an entry whose prior node is in B.
"
Class {
	#name : #EpLogNode,
	#superclass : #Object,
	#instVars : [
		'referencedNodes'
	],
	#category : #EpiceaBrowsers-UI-Graph,
	#timestamp : 'MartinDias 1/20/2017 13:24'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>globalName [

	^ self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>initialize [
	super initialize.
	
	referencedNodes := Set new.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>isMonitor [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>log [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>modificationTime [

	^ self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>populateReferencedNodesWith: nodes [

	self referencedGlobalNames do: [ :referencedGlobalName |
		nodes
			detect: [:each | each globalName = referencedGlobalName ]
			ifFound: [ :referencedNode | referencedNodes add: referencedNode ] ] 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>referencedGlobalNames [

	| firstEntry priorReference |
	firstEntry := self log firstEntryIfAbsent: [ ^ self referencedGlobalNamesIfEmptyLog ].
	priorReference := firstEntry tags at: EpLog priorReferenceKey ifAbsent: [ ^ #() ].
	priorReference isNull ifTrue: [ ^ #() ].
	
	"Could happen when monitor's ombu file is removed externally"
	priorReference globalName = self globalName ifTrue: [ ^ #() ].

	^ { priorReference globalName }
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>referencedGlobalNamesIfEmptyLog [

	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogNode>>referencedNodes [
	"Answer the referenced nodes, that were populated previously by #populateReferencedNodesWith:"
	
	^ referencedNodes
]
