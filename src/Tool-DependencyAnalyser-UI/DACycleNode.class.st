"
A PDCycleNode is used to display a cycle in a tree.
"
Class {
	#name : #DACycleNode,
	#superclass : #DANode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 7/11/2014 11:43'
}

{
	#category : #building-menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACycleNode>>addMenuEntriesOn: aMenuGroup [
	| graphvizGenerator |

	aMenuGroup 
		addMenuItem:
			(MenuItemModel new
						name: 'Generate GraphViz file';
						action: [ self ifGraphVizAbsent: [ self error: 'Please install Graphviz Support' ].
									graphvizGenerator := DAPackageCycleGenerator 
										newWith: self cycle 
										named: 'CycleGraph' , self cycle size asString , 'nodes'.
									self saveGraphAndOpenWith: graphvizGenerator ])
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACycleNode>>browseInNautilus [
	"we cannot browse a cycle in Nautilus"
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACycleNode>>childNodeClassFor: anItem [
	^ DAPackageUnderAnalysisNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACycleNode>>children [
	^ self content packages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACycleNode>>icon [
	^ self iconNamed: #refreshIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACycleNode>>isCycleNode [
	^ true
]
