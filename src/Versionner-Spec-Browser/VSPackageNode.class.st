"
Class used to display packages in a tree.
"
Class {
	#name : #VSPackageNode,
	#superclass : #TreeNodeModel,
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSPackageNode>>childNodeClassFor: anItem [
	^ VSDetailsLeafNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSPackageNode>>children [
	^ [ self content dependencies collect: [ :each | 'requires: ' , each] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSPackageNode>>hasChildren [
	^ self content dependencies isNotEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSPackageNode>>icon [
	^  self iconNamed: #packageColoredIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSPackageNode>>textMorph [
	^ self theme newTextIn: World text: self item asString
]
