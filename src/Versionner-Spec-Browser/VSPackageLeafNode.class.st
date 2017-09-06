"
Abstract class used to display a package with its specific icons and no child in a tree.
"
Class {
	#name : #VSPackageLeafNode,
	#superclass : #VSPackageNode,
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSPackageLeafNode>>children [
	^ [ #() ]

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSPackageLeafNode>>hasChildren [
	^ false
]
