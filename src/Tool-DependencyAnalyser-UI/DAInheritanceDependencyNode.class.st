"
A PDCycleNode is used to display a inheritance dependency in a tree.
"
Class {
	#name : #DAInheritanceDependencyNode,
	#superclass : #DAClassNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 7/11/2014 11:45'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAInheritanceDependencyNode>>browseInOtherNautilus [
	self browseClass: self content superclass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAInheritanceDependencyNode>>icon [
	^ self iconNamed: #arrowUpIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAInheritanceDependencyNode>>isClassToDependencyNode [
	^ true
]
