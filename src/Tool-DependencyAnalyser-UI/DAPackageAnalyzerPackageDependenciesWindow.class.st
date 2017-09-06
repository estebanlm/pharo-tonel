"
UI merging SpecTreeModel cycles and Nautilus UI.
"
Class {
	#name : #DAPackageAnalyzerPackageDependenciesWindow,
	#superclass : #DAPackageAnalyzerWindow,
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 11:55'
}

{
	#category : #nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerPackageDependenciesWindow class>>browseDependencies: aBuilder [
	<contextMenu>
	<nautilusGlobalPackageMenu>
	(aBuilder item: #'Browse dependencies...')
		action: [ (self onPackagesNamed: (self selectedPackagesFrom: aBuilder)) open ];
		order: 1000.
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerPackageDependenciesWindow class>>collections [
	^ (self onPackagesMatch: '*Collections*') open
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerPackageDependenciesWindow class>>onPackagesMatch: match [
	^ (self onPackagesNamed:
			(RPackageOrganizer default packages
				select: [ :package | match match: package packageName asString ]
				thenCollect: [ :package | package packageName ]) ) 
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerPackageDependenciesWindow class>>system [
	^ (self onPackagesNamed: self systemPackages) open 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerPackageDependenciesWindow>>initializeWithPackageNames: aCollection [
	packageAnalyzerTreeModel := DAPackageAnalyzerTreeModel onPackagesNamed: aCollection.
	self buildandAddAllMorph 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerPackageDependenciesWindow>>initializeWithRelationGraph: aRelationGraph [
	packageAnalyzerTreeModel := DAPackageAnalyzerReverseTreeModel onRelationGraph: aRelationGraph.
	self buildandAddAllMorph 
]
