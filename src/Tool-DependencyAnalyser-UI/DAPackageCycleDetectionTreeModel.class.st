"
A PDPackageDetectCycleTreeModel shows all cycles among packages from a graph of dependencies.
"
Class {
	#name : #DAPackageCycleDetectionTreeModel,
	#superclass : #DAPackageTreeModel,
	#instVars : [
		'analysis',
		'cycles',
		'cyclesLabel',
		'filter',
		'buttonReversed'
	],
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 6/12/2014 15:50'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn:
			[ :col | 
			col
				newRow: [ :row | 
							row
								add: #buttonReversed;
								add: #buttonRefresh ]
					height: 30;
				newRow: [ :row | 
							row
								add: #cyclesLabel ]
					height: 30;
				add: #tree ] yourself
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel class>>onPackagesMatch: match [
	^ (self onPackagesNamed:
			(RPackageOrganizer default packages
				select: [ :package | match match: package packageName asString ]
				thenCollect: [ :package | package packageName ]) ) 
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel class>>onPackagesNamed: aCollection [
	^ self new 
		initializeWithPackageName: aCollection;
		yourself
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel class>>system [
	^ self onPackagesNamed: 
		(RPackageOrganizer default packages collect: [ :package | package packageName asString ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>analysis [
	^ analysis
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>analysis: anObject [
	analysis := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>buildRoots [
	self tree
		roots: cycles;
		whenBuiltDo: [ 
					tree
						rootNodeHolder: [ :item | 
							DACycleNode new
								content: item;
								treeModelParent: self;
								packageTreeNautilus: self packageTreeNautilus;
								packageTreeNautilusUI: self packageTreeNautilusUI;
								cycle: true ] ].
	self cyclesLabel
		label:
			'Analysis of ' , self cycles size asString , ' cycles'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>buttonReversed [
	^ buttonReversed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>cycles [
	^ cycles
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>cycles: aCollectionOfCycles [
	cycles := aCollectionOfCycles sorted: [ :a :b | a size > b size ].
	self buildRoots.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>cyclesLabel [
	^ cyclesLabel
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>extent [
	^ 1000@600
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>filter [
	^ filter
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>filterWithPackages [
	
	self cycles: (self analysis cyclesWithAtLeast: filter)
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>filterWithPackages: aCollectionOfPDPackage [
	filter := aCollectionOfPDPackage.
	self cycles: (self analysis cyclesWithAtLeast: filter)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>initializePresenter [
	super initializePresenter.
	
	buttonReversed action: [ self reversedRoots  ].
	
	
	
	tree
		whenSelectedItemChanged: [ :item | 
			item
				ifNotNil: [ 
					self tree selectedItem browseInNautilus.
					tree menu: [ :aMenu | self loadMenuFor: item in: aMenu ] ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>initializeWidgets [
	super initializeWidgets.
	
	cyclesLabel := self newLabel
			label: 'Analysis of cycles'.
	
	buttonReversed := self newButton
			help: 'Reversed the order of cycles';
			label: 'Sort by length'.
	
		
	
	
		
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>initializeWithPackageName: aCollection [
	
	self analysis:  (DAPackageCycleDetector onPackagesNamed: aCollection) runAlgorithm.
	
	self cycles: self analysis cycles.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>packageTreeNautilus: anObject [
	packageTreeNautilus := anObject
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>refresh [
	self analysis refresh.
	self filter ifNil: [ self cycles: self analysis cycles ]
		ifNotNil: [ self cycles: (self analysis cyclesWithAtLeast: filter) ].
	self buildRoots
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>reversedRoots [
	self tree roots: (self tree roots reversed).
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleDetectionTreeModel>>title [
	^ 'Cycles analysis'
]
