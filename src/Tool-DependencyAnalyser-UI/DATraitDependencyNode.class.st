"
A PDCycleNode is used to display a trait dependency in a tree.
"
Class {
	#name : #DATraitDependencyNode,
	#superclass : #DAClassNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 7/11/2014 11:47'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATraitDependencyNode>>browseInOtherNautilus [
	self browseClass: self content trait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATraitDependencyNode>>icon [
	^  Smalltalk ui icons iconNamed: #traitIcon
]
