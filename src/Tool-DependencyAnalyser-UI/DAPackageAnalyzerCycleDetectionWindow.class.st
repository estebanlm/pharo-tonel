"
UI merging SpecTreeModel package dependencies and Nautilus UI.
"
Class {
	#name : #DAPackageAnalyzerCycleDetectionWindow,
	#superclass : #DAPackageAnalyzerWindow,
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 11:55'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerCycleDetectionWindow class>>collections [
	^ (self onPackagesMatch: '*Collections*')
		open
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerCycleDetectionWindow class>>onPackagesMatch: match [
	^ (self onPackagesNamed:	self systemPackages) 
		open
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerCycleDetectionWindow class>>system [
	^ (self new initializeWithFilter: self systemPackages) 
		open
]

{
	#category : #initialization-filter,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerCycleDetectionWindow>>initializeCycleDetectionTreeModelWith: aCollection [

	self initializeWithSystemCycles.
	packageAnalyzerTreeModel filterWithPackages: aCollection
]

{
	#category : #initialization-filter,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerCycleDetectionWindow>>initializeWithFilter: aCollection [
	self initializeCycleDetectionTreeModelWith: aCollection.
	self buildandAddAllMorph
]

{
	#category : #initialization-union,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerCycleDetectionWindow>>initializeWithPackageNames: aCollection [
	packageAnalyzerTreeModel  := DAPackageCycleDetectionTreeModel  onPackagesNamed: aCollection.
	self buildandAddAllMorph 
]

{
	#category : #initialization-filter,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerCycleDetectionWindow>>initializeWithSystemCycles [
	packageAnalyzerTreeModel := DAPackageCycleDetectionTreeModel system.
]

{
	#category : #update,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerCycleDetectionWindow>>updateWithFilter: aCollectionOfPDPackages [
	self packageAnalyzerTreeModel filterWithPackages: aCollectionOfPDPackages.
]
