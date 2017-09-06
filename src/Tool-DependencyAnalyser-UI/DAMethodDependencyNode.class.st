"
A PDMethodNode is the superclass node for PDReferenceDependencyNode and PDExtensionDependencyNode. 
Indeed these two nodes have the same behavior to browse the dependency in the Nautilus UI.

"
Class {
	#name : #DAMethodDependencyNode,
	#superclass : #DANode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 7/11/2014 11:46'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMethodDependencyNode>>browseInNautilus [
	self browseMethodInNautilus: self content method
]
