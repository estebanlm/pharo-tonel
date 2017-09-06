"
Used to announce a change request on the tree
"
Class {
	#name : #MorphTreeChangeRequest,
	#superclass : #MorphTreeAnnounce,
	#instVars : [
		'action',
		'arguments'
	],
	#category : #Morphic-Widgets-Tree-Announcements,
	#timestamp : 'TorstenBergmann 9/5/2014 15:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>chunkSize: anInteger [
	^ self new action: #chunkSize:; arguments: (Array with: anInteger)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>collapseAll [
	^ self new action: #collapseAll
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>collapseNodePath: aNodePath [
	^ self new action: #collapseNodePath:; arguments: (Array with: aNodePath) 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>deselectAll [
	^ self new action: #deselectAll
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>enabled [
	^ self new action: #enabledFromModel
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>expandAll [
	^ self new action: #expandAll
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>expandAllFromNode: aNode [
	^ self new action: #expandAllFromNode:; arguments: (Array with: aNode)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>expandItemPath: anItemPath [
	^ self new action: #expandItemPath:; arguments: (Array with: anItemPath)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>expandNodePath: aNodePath [
	^ self new action: #expandNodePath:; arguments: (Array with: aNodePath)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>expandRoots [
	^ self new action: #expandRoots
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>pageSize: anInteger [
	^ self new action: #pageSize:; arguments: (Array with: anInteger)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>selectAll [
	^ self new action: #selectAll
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>selectItems: itemsList [
	^ self new action: #selectItems:; arguments: (Array with: itemsList)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>updateList [
	^ self new action: #updateList
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest class>>updateSelectionFromModel [
	^ self new action: #updateSelectionFromModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest>>action: aSymbol [
	action := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest>>arguments [
	^ arguments ifNil: [Array new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest>>arguments: anArray [
	arguments := anArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeChangeRequest>>change: aTreeMorph [
	action ifNil: [^self].
	aTreeMorph perform: action withEnoughArguments: self arguments
]
