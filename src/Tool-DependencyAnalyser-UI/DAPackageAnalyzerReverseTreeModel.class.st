"
A PDPackageAnalyzerReverseTreeModel shows all users from a set of packages. Also you can see all type of the dependency, and browse them.

The window is initialized with a relation graph of package dependencies, with all the dependencies already compute.
"
Class {
	#name : #DAPackageAnalyzerReverseTreeModel,
	#superclass : #DAPackageTreeModel,
	#instVars : [
		'relationGraph',
		'packageLabel'
	],
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 8/4/2014 10:47'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn:
			[ :col | 
			col
				newRow: [ :row | row add: #buttonRefresh ] height: 30;
				newRow: [ :row | 
							row
								add: #packageLabel ]
					height: 30;
				add: #tree ] yourself
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel class>>onRelationGraph: aRelationGraph [
	^ self new
		initializeWithRelationGraph: aRelationGraph;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>buildRoots [
	| collectionOfWrapper |
	collectionOfWrapper := relationGraph allDependentPackagesFromSeenPackages
		collect: [ :package | package asDependentPackageWrapperOn: relationGraph ].
	
	self tree roots: (self nodesFor: collectionOfWrapper asSortedCollection).
	self updatePackageLabel.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>initializePresenter [
	super initializePresenter.
	
	tree
		whenSelectedItemChanged: [ :item | 
			item
				ifNotNil: [ 
					self tree selectedItem browseInNautilus.
					tree menu: [ :aMenu | self loadMenuFor: item in: aMenu ] ] ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>initializeWidgets [
	super initializeWidgets.
	
	packageLabel := self newLabel label: 'Analysis of packages'.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>initializeWithRelationGraph: aRelationGraph [
	relationGraph := aRelationGraph.
	self buildRoots.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>nodesFor: anItemList [
	^ anItemList collect: 
		[ :each | 
		DAReversePackageNode new
						content: each;
						treeModelParent: self;
						packageTreeNautilus: self packageTreeNautilus;
						packageTreeNautilusUI: self packageTreeNautilusUI;
						cycle: false;
						yourself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>packageLabel [
	^ packageLabel
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>refresh [
		self isOpen ifTrue: [  
			self relationGraph refreshGraph.
			self buildRoots].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>relationGraph [
	^ relationGraph
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>title [
	^ 'Package Dependencies Reverse Analysis'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerReverseTreeModel>>updatePackageLabel [
	self packageLabel label: 'Analysis of ' , self tree roots size asString , ' package(s)'
]
