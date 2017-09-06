"
Class used to display projects with specific icons and no child in a tree.
"
Class {
	#name : #VSProjectNode,
	#superclass : #TreeNodeModel,
	#category : #Versionner-Spec-Browser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSProjectNode>>childNodeClassFor: anItem [
	^ VSDetailsLeafNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSProjectNode>>children [
	^ [ self content dependencies collect: [ :each | 'loads: ' , each] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSProjectNode>>hasChildren [
	^ self content dependencies isNotEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSProjectNode>>icon [
	 
	^ VersionnerSpecBrowser configurationLoadedIcon
]
