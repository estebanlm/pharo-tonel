"
I reprensent a package assembly (i.e. a set of packages).
I collect all dependencies related to the assembly parts.
"
Class {
	#name : #DAAssemblyNode,
	#superclass : #DANode,
	#instVars : [
		'dependencies'
	],
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'ChristopheDemarey 7/8/2015 14:17'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode class>>newWith: aCollection  [
	^ self basicNew
		initializeWith: aCollection;
		yourself
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>browseInNautilus [
	"nothing to browse"
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>childNodeClassFor: anItem [
	^ DADependentPackageNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>children [
	^ dependencies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>daPackage [
	^ self parentNode daPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>dependencies [
	^ dependencies
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>hasChildren [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>icon [
	^ self iconNamed: #forwardIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>includes: aPackageName [
	^ (self dependencies collect: #packageName) includes: aPackageName
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>initializeWith: aCollection  [
	self initialize.
	dependencies := aCollection
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAssemblyNode>>label [
	^ self content
]
