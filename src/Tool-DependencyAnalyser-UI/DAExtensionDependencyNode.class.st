"
A PDCycleNode is used to display a extension dependency in a tree.
"
Class {
	#name : #DAExtensionDependencyNode,
	#superclass : #DAMethodDependencyNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 7/11/2014 11:46'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAExtensionDependencyNode>>icon [
	^  self iconNamed: #editIcon
]
