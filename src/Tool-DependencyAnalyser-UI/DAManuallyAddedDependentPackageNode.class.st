"
I'm a node  representing a dependency not computed automatically but added manually on the package Manifest.
"
Class {
	#name : #DAManuallyAddedDependentPackageNode,
	#superclass : #DADependentPackageNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'ChristopheDemarey 8/13/2015 14:42'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAManuallyAddedDependentPackageNode>>browseInNautilus [
	"Nothing to do"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAManuallyAddedDependentPackageNode>>children [
	^ self content dependencies flatCollect: 
		[ :dependency | 
		dependency users collect: 
			[ :association | | method sentMessages |
			method := association key.
			sentMessages := association value.
			DAMessageSendDependencyNode new
				content: method;
				parentNode: self;
				sentMessages: sentMessages 
				yourself ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAManuallyAddedDependentPackageNode>>hasChildren [
	^ [ self children isNotEmpty ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAManuallyAddedDependentPackageNode>>icon [
	^ self iconNamed: #smallRedoIcon
]
