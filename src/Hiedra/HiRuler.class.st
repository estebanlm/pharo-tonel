"
I represent a ruler of nodes with links.
"
Class {
	#name : #HiRuler,
	#superclass : #Object,
	#instVars : [
		'freeColumnIndexByRow',
		'linkBuilders',
		'values',
		'nodes',
		'links'
	],
	#category : #Hiedra-Rendering,
	#timestamp : '<historical>'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>build [
	freeColumnIndexByRow := Array new: values size withAll: 1. 
	nodes := OrderedCollection new.
	links := OrderedCollection new.
	
	HiNodesAndLinksIterator new 
		linkBuilders: linkBuilders;
		values: values;
		doWithNodes: [ :node | self processNode: node ]
		doWithLinks: [ :link | self processLink: link ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>freeColumnIndexAt: rowIndex [
	^ freeColumnIndexByRow at: rowIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>indentAt: rowIndex [
	freeColumnIndexByRow 
		at: rowIndex 
		put: (freeColumnIndexByRow at: rowIndex) + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>linkBuilders [
	^ linkBuilders
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>linkBuilders: aCollection [
	linkBuilders := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>links [
	^ links
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>nodes [
	^ nodes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>numberOfColumns [
	^ freeColumnIndexByRow 
		ifEmpty: [ 0 ]
		ifNotEmpty: [ freeColumnIndexByRow max ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>processLink: aLink [
	| checkpoints |
	links add: aLink.
	
	checkpoints := OrderedCollection new.

	"add origin checkpoint"
	checkpoints add: aLink origin rulerPoint.
	
	"add checkpoints in the middle"
	aLink intermediateIndices do: [ :rowIndex |
		checkpoints add: (freeColumnIndexByRow at: rowIndex) @ rowIndex.

		self indentAt: rowIndex ].
		
	"add target checkpoint"
	checkpoints add: aLink target rulerPoint.

	"register checkpoints"
	 aLink checkpoints: checkpoints
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>processNode: node [
	
	nodes add: node.
	node columnIndex: (freeColumnIndexByRow at: node rowIndex).
	self indentAt: node rowIndex.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRuler>>values: aCollection  [
	values := aCollection
]
