"
A PDCycleNode is used to display a reference dependency in a tree.
"
Class {
	#name : #DAReferenceDependencyNode,
	#superclass : #DAMethodDependencyNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 7/11/2014 11:47'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependencyNode>>browseInOtherNautilus [
	| classToBrowse |
	classToBrowse := self content reference.
	self browseClass: classToBrowse
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependencyNode>>browseSendersOrUsers [
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependencyNode>>icon [
	^ self iconNamed: #classIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependencyNode>>isClassToDependencyNode [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReferenceDependencyNode>>isReferenceNode [
	  ^ true
]
