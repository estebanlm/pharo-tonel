"
Abstract class from package node displaying in the tree.
"
Class {
	#name : #DAAbstractPackageNode,
	#superclass : #DANode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 8/1/2014 15:58'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractPackageNode>>browseInNautilus [
	self browsePackageInNautilus: self rPackage.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractPackageNode>>packageName [
	^ self content target packageName
]
