"
A PDDependentPackageNode is used to display a dependent package in a tree.
"
Class {
	#name : #DADependentPackageNode,
	#superclass : #DAAbstractPackageNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 8/3/2014 13:37'
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>childNodeClassFor: anItem [
	^ anItem nodeClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>children [
	| aCompositeDependency |
	aCompositeDependency := self compositeDependencyTo.
	^ aCompositeDependency dependencies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>compositeDependencyTo [
	"should return one composite dependency anytime"
	^ self content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>daPackage [
	^ self parentNode daPackage
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>hasChildren [
	^ [ self content dependencies notEmpty ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>icon [
	^ self iconNamed: #forwardIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>isPackageNode [
	^ true
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>label [
	^ self rPackage packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageNode>>rPackage [
	^ self content target rPackageSet
]
