"
A PDPackageTreeModel is an abstract class. It's a the superclass of the two tree model vizualisations (package dependency and cycle detection).
"
Class {
	#name : #DAPackageTreeModel,
	#superclass : #ComposableModel,
	#instVars : [
		'tree',
		'packageTreeNautilus',
		'buttonRefresh',
		'packageTreeNautilusUI',
		'open'
	],
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 14:47'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>actionOnRefresh [
	buttonRefresh action: [ self refresh ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>addDependenciesOptionsFor: selectedNodes on: menuGroup [
	| namesOfSelected |
	(self areClassToDependencyNodes: selectedNodes)
		ifTrue: [ 
			namesOfSelected := selectedNodes collect: [ :package | package content theClass ].
			menuGroup
				addMenuItem:
					(MenuItemModel new
						name: 'Browse dependencies from class';
						action: [ self openTreeFor: namesOfSelected ]) ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>addPackageOptionsFor: selectedNodes on: menuGroup [
	| selectedPackageNames |
	(self arePackageNodes: selectedNodes)
		ifTrue: [ 
			selectedPackageNames := selectedNodes collect: [ :packageNode | packageNode packageName ].
			menuGroup
				addMenuItem:
					(MenuItemModel new
						name: 'Browse scoped dependencies';
						action: [ (DAPackageAnalyzerPackageDependenciesWindow onPackagesNamed: selectedPackageNames) open ]).
			selectedNodes size > 1
				ifTrue: [ 
					menuGroup
						addMenuItem:
							(MenuItemModel new
								name: 'Find cycles among packages';
								action: [ (DAPackageAnalyzerCycleDetectionWindow onPackagesNamed: selectedPackageNames) open ]) ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>areClassToDependencyNodes: aCollectionOfItem [
	^ aCollectionOfItem allSatisfy: [ :node |  node isClassToDependencyNode ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>arePackageNodes: aCollectionOfItem [
	^ aCollectionOfItem allSatisfy: [ :node |  node isPackageNode ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>browseReference [
	self selectedItemFromTree isReferenceNode ifTrue: [ 
			self selectedItemFromTree browseReference
		 ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>buildRoots [
	self subclassResponsibility.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>buttonRefresh [
	^ buttonRefresh
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>close [
	open := false
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>defaultFormat [
	^ #png
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>ifGraphVizAbsent: aBlock [
	Smalltalk at: #GVGraphViz ifAbsent: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>initializePresenter [
	self actionOnRefresh
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>initializeWidgets [
	tree := self newTree
		multiSelection: true;
		on: $b meta
			do: [ self selectedItemFromTree browseInOtherNautilus ];
		columns: {(TreeColumnModel new displayBlock: [ :node | node label ])};
		yourself.
	buttonRefresh := self newButton
		icon: (self iconNamed: #refreshIcon);
		help: 'Refresh the TreeModel';
		label: 'Refresh';
		yourself.
	packageTreeNautilus := Nautilus new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>isOpen [
	^ open
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>loadMenuFor: item in: aMenu [
	| menuGroup selectedNodes |
	selectedNodes := self selectedItemsFromTree.
	menuGroup := MenuGroupModel new.
	self addPackageOptionsFor: selectedNodes on: menuGroup.
	self addDependenciesOptionsFor: selectedNodes asSet on: menuGroup.
	(selectedNodes size = 1)
		ifTrue: [ selectedNodes first addMenuEntriesOn: menuGroup ].
	
	aMenu addMenuGroup: menuGroup.
	^ aMenu
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>open [
	open := true.
	^ self openWithSpec 
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>openTreeFor: namesOfSelected [
	| treeToOpen relationGraph |
	treeToOpen := TreeModel new.
	relationGraph := self tree owner relationGraph.
	^ treeToOpen
		roots: namesOfSelected;
		whenBuiltDo: [ 
					treeToOpen
						rootNodeHolder: [ :item | 
							DAClassToDependencyNode new
								content: item;
								package: (relationGraph pdPackageFrom: item) ] ];
		title: 'Class dependencies';
		extent: 700 @ 500;
		openWithSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>packageTreeNautilus [
	^ packageTreeNautilus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>packageTreeNautilusUI [
	^ packageTreeNautilusUI
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>packageTreeNautilusUI: anObject [
	packageTreeNautilusUI := anObject.
	"have to rebuild the roots, because the Nautilus UI just changed"
	self buildRoots
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>refresh [
	self subclassResponsibility 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>saveGraphAndOpenWith: graphvizGenerator [
	graphvizGenerator saveDotFileAndGenerateForType: self defaultFormat.
	^ graphvizGenerator openWith: self defaultFormat
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>selectedItemFromTree [
	^ self tree selectedItem
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>selectedItemsFromTree [
	^ self tree selectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageTreeModel>>tree [
	^ tree
]
