"
A PDPackageAnalyzerDiffTreeModel is to watch what are the difference between two analysis of dependencies.
"
Class {
	#name : #DAPackageAnalyzerDiffTreeModel,
	#superclass : #ComposableModel,
	#instVars : [
		'treeDiff',
		'packageRelationGraphDiff'
	],
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 8/7/2014 18:26'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed newColumn: [ :col | col add: #treeDiff ] yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel class>>newWith: oldRelationGraph on: newRelationGraph [
	^ self new
		initializeWith: oldRelationGraph on: newRelationGraph;
		yourself.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel>>buildRoots [
	self treeDiff roots: packageRelationGraphDiff packagesDiffToDisplay.
	self treeDiff whenBuiltDo: [ treeDiff rootNodeHolder: [ :item | DAPackageItemDiffNode new content: item ] ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel>>extent [
	^ 900@900
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel>>initializeWidgets [
	
	treeDiff := self newTree
		multiSelection: true;
		yourself.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel>>initializeWith: oldRelationGraph on: newRelationGraph [
	packageRelationGraphDiff := DAPackageRelationGraphDiff new
		oldRelationGraph: oldRelationGraph;
		newRelationGraph: newRelationGraph.
	packageRelationGraphDiff make.
	
	self buildRoots
	
	
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel>>open	 [
	^ self openWithSpec
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel>>title [
	^ 'Package Dependencies Analysis Diff'
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerDiffTreeModel>>treeDiff [
	^ treeDiff
]
