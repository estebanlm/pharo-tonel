"
A PDPackageNode is used to display a package diff in a tree.
"
Class {
	#name : #DAPackageItemDiffNode,
	#superclass : #TreeNodeModel,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 8/8/2014 17:51'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageItemDiffNode>>icon [
	self content isNew ifTrue: [ ^ self iconNamed: #changeAddIcon ].
	self content isRemoved ifTrue: [^ self iconNamed: #smallCancelIcon ].
	^ self iconNamed: #forwardIcon
]
