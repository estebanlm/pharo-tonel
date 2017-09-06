"
Abstract class used to display groups in a tree.
"
Class {
	#name : #VSGroupNode,
	#superclass : #TreeNodeModel,
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSGroupNode>>childNodeClassFor: anItem [
	"Use a specific wrapper node to display different icons."
	
	^ (self content project dependencyNamed: anItem) 
		ifNil: [ VSGroupLeafNode] "can be nil for 'default' or 'ALL'"
		ifNotNil: [ :dependency | dependency treeNodeClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSGroupNode>>children [
	^ [ self content dependencies ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSGroupNode>>hasChildren [
	^ self content dependencies isNotEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSGroupNode>>icon [
	^ self iconNamed: #groupIcon
]
