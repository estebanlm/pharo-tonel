"
A PDReverseDependentPackageNode is used to display a dependent package in a reverse tree.
"
Class {
	#name : #DAReverseDependentPackageNode,
	#superclass : #DAAbstractPackageNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 8/3/2014 13:37'
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReverseDependentPackageNode>>childNodeClassFor: anItem [
	^ anItem nodeClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReverseDependentPackageNode>>children [
	^ self dependenciesToParentNode dependencies
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReverseDependentPackageNode>>dependenciesToParentNode [
	^ self content daPackage 
		compositeDependencyTo: (self parentNode content daPackage)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReverseDependentPackageNode>>hasChildren [
	^ self dependenciesToParentNode isNotNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReverseDependentPackageNode>>icon [
	^ self iconNamed: #backIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAReverseDependentPackageNode>>rPackage [
	^ self content rPackageSet
]
