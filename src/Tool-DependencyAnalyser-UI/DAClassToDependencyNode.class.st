"

"
Class {
	#name : #DAClassToDependencyNode,
	#superclass : #DAClassNode,
	#instVars : [
		'package'
	],
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : ''
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassToDependencyNode>>browseInOtherNautilus [
	self browseClass: self content browse
]

{
	#category : #procotol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassToDependencyNode>>childNodeClassFor: anItem [
	 ^ anItem nodeClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassToDependencyNode>>children [
	^ self dependencies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassToDependencyNode>>dependencies [
	^ self package dependenciesFrom: self content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassToDependencyNode>>hasChildren [
	^ self dependencies isNotEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassToDependencyNode>>icon [
	^ self iconNamed: #confirmIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassToDependencyNode>>package [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAClassToDependencyNode>>package: anObject [
	package := anObject
]
