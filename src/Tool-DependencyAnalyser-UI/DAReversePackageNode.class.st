"
A PDReversePackageNode is a node to display a package in the tree during a reverse analysis.
"
Class {
	#name : #DAReversePackageNode,
	#superclass : #DAAbstractPackageNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 8/1/2014 16:02'
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReversePackageNode>>childNodeClassFor: anItem [
	^ DAReverseDependentPackageNode 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReversePackageNode>>children [
	^ (self content usersOfPackage 
		collect: [ :each | each asPackageDependencyWrapper ]) asSortedCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReversePackageNode>>hasChildren [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReversePackageNode>>icon [
	^ self iconNamed: #packageIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReversePackageNode>>rPackage [
	^ self content rPackageSet
]
