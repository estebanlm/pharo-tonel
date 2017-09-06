"
Abstract class used to display a group with its specific icons and no child in a tree.
"
Class {
	#name : #VSGroupLeafNode,
	#superclass : #VSGroupNode,
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSGroupLeafNode>>children [
	^ [ #() ]

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSGroupLeafNode>>hasChildren [
	^ false
]
