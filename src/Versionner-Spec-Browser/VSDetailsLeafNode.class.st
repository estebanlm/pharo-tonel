"
A VSDetailsLeafNode is used to display dependencies requirements or project loads in a tree.
"
Class {
	#name : #VSDetailsLeafNode,
	#superclass : #TreeNodeModel,
	#category : #Versionner-Spec-Browser
}

{ #category : #accessing }
VSDetailsLeafNode >> icon [
	^  self iconNamed: #forwardIcon
]
