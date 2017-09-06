"
Superclass for selections in a morphic based tree
"
Class {
	#name : #MorphTreeMorphSelection,
	#superclass : #Object,
	#category : #Morphic-Widgets-Tree,
	#timestamp : 'TorstenBergmann 9/5/2014 15:27'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>addNode: aNode [
	self addNodePath: aNode path
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>addNodePath: aPath [
	^ self subclassResponsibility 
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>empty [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>lastSelectedNode [
	^ self lastSelectedNodePath ifNotNil: [:path | path ifEmpty: [nil] ifNotEmpty: [:p | path last]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>lastSelectedNodePath  [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>removeNode: aNode [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>selectedItemOrItemsOrNil [
	^ self lastSelectedNode isNil 
		ifTrue: [ nil ]
		ifFalse: [ self lastSelectedNode item ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>selectedItems [
	^ self selectedNodes collect: [:n | n item]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>selectedNodePathList [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>selectedNodes [
	^ self lastSelectedNode
		ifNotNil: [:l | OrderedCollection with: l]
		ifNil: [OrderedCollection new]
]

{
	#category : #'view updating',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeMorphSelection>>updateView: aTreeMorph forModel: aTreeModel [
	aTreeMorph updateFromSelection: self.
	aTreeModel selectionChanged
]
