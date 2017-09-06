"
A PDPackageNode is used to display a package in a tree.
"
Class {
	#name : #DAPackageUnderAnalysisNode,
	#superclass : #DAAbstractPackageNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 8/8/2014 17:51'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>><= aDANode  [
	^ (aDANode class respondsTo: #packageName) and: [ self packageName <= aDANode packageName ]
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>assemblyNodeFor: anAssemblyManifest [
	^ (DAAssemblyNode newWith: (self packageDependencies 
			select: [ :dependency | anAssemblyManifest includes: dependency packageName ]
			thenCollect: #asPackageDependencyWrapper))
		content: anAssemblyManifest packageName;
		yourself
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>assemblyNodesFor: aListOfAssemblyManifest [
	^ aListOfAssemblyManifest 
		collect: [ :each | self assemblyNodeFor: each ]
		as: OrderedCollection
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>browseInNautilus [
	self browsePackageInNautilus: self content rPackage
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>childNodeClassFor: anItem [
	 ^ anItem nodeClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>children [
	^ (self packageDependencies"GroupedByAssembly" sort: [ :a :b | a packageName < b packageName])
		copyWith: DAPotentialDependenciesNode new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>daPackage [
	^ self content
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>hasChildren [
	^ [ true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>icon [
	^ self iconNamed: #packageIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>isPackageNode [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>manuallyResolvedDependencies [
	^ self packageUnderAnalysis manuallyResolvedDependencies
		collect: [ :packageName | DAManuallyAddedDependentPackageNode new content: packageName ]
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>packageDependencies [
	^ self rootNode isCycle
		ifTrue: [ self rootNode content dependentPackagesFrom: self content ]
		ifFalse: [ self content dependencies ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>packageName [
	^ self daPackage packageName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self content printOn: aStream.
	aStream nextPut: $)

]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>wrappedPackageDependencies [
	^ (self packageDependencies
		collect: #asPackageDependencyWrapper 
		as: OrderedCollection) sorted
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageUnderAnalysisNode>>wrappedPackageDependenciesGroupedByAssembly [
	| assemblyNodes |
	assemblyNodes := self assemblyNodesFor: { CollectionsAssembly . PharoKernelAssembly }.
	^ ((self packageDependencies
		reject: [ :dependency | 
			assemblyNodes anySatisfy: [ :assemblyNode | assemblyNode includes: dependency packageName ] ]
		thenCollect: #asPackageDependencyWrapper) sorted asOrderedCollection)
		addAll: assemblyNodes;
		yourself
]
