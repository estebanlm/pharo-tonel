"
A VSDetailsLeafNode is used to display dependencies requirements or project loads in a tree.
"
Class {
	#name : #VSDetailsLeafNode,
	#superclass : #TreeNodeModel,
	#category : #Versionner-Spec-Browser,
	#timestamp : 'ChristopheDemarey 2/21/2014 17:41'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSDetailsLeafNode>>icon [
	^  self iconNamed: #forwardIcon
]
