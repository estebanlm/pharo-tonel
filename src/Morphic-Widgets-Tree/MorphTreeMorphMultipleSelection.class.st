"
Multiple selections in a morphic based tree
"
Class {
	#name : #MorphTreeMorphMultipleSelection,
	#superclass : #MorphTreeMorphSelection,
	#instVars : [
		'selectedNodePathList'
	],
	#category : #Morphic-Widgets-Tree,
	#timestamp : 'TorstenBergmann 9/5/2014 15:28'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>addNodePath: aPath [
	self selectedNodePathList add: aPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>empty [
	self selectedNodePathList: OrderedCollection new

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>lastSelectedNodePath [
	^ self selectedNodePathList ifNotEmpty: [:l | l last]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>removeNode: aNode [
	self selectedNodePathList remove: aNode path ifAbsent: []

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>selectedItemOrItemsOrNil [
	| theItems |
	theItems := self selectedNodeList collect: [ :each | each item ].
	^ theItems isEmpty ifTrue: [nil] ifFalse: [ theItems ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>selectedNodeList [
	^ self selectedNodePathList 
		ifNil: [#()]
		ifNotNil: [:l | l collect: [:path | path last]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>selectedNodePathList [
	^ selectedNodePathList ifNil: [selectedNodePathList := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>selectedNodePathList: aCollectionOfPath [
	selectedNodePathList := aCollectionOfPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphMultipleSelection>>selectedNodes [
	^ OrderedCollection withAll: self selectedNodeList

]
