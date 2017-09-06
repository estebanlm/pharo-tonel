"
Single selections in a morphic based tree
"
Class {
	#name : #MorphTreeMorphSingleSelection,
	#superclass : #MorphTreeMorphSelection,
	#instVars : [
		'selectedNodePath'
	],
	#category : #Morphic-Widgets-Tree,
	#timestamp : 'TorstenBergmann 9/5/2014 15:28'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSingleSelection>>addNodePath: aPath [
	self selectedNodePath: aPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSingleSelection>>empty [
	self selectedNodePath: nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSingleSelection>>lastSelectedNodePath [
	^ self selectedNodePath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSingleSelection>>removeNode: aNode [
	self selectedNodePath = aNode path
		ifTrue: [self selectedNodePath: nil]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSingleSelection>>selectedNodePath [
	^ selectedNodePath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSingleSelection>>selectedNodePath: aSelectionPath [
	selectedNodePath := aSelectionPath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSingleSelection>>selectedNodePathList [
	^ self selectedNodePath ifNil: [#()] ifNotNil: [Array with: self selectedNodePath]
]
