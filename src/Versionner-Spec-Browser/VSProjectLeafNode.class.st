"
Abstract class used to display a project with its specific icons and no child in a tree.
"
Class {
	#name : #VSProjectLeafNode,
	#superclass : #VSProjectNode,
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSProjectLeafNode>>children [
	^ [ #() ]

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSProjectLeafNode>>hasChildren [
	^ false
]
