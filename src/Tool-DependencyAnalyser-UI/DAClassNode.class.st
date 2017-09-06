"
A PDClassDependencyNode is the superclass node for PDInheritanceNode and PDTraitDependencyNode. 
Indeed these two nodes have the same behavior to browse the dependency in the Nautilus UI.

"
Class {
	#name : #DAClassNode,
	#superclass : #DANode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 7/25/2014 14:46'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassNode>>browseInNautilus [
	self browseClassInNautilus: self classFromContent
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassNode>>classFromContent [
	^ self content theClass
]
