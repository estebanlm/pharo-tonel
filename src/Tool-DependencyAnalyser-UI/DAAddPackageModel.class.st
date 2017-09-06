"
A simple CompasableModel to add new packages to the current package dependencies analysis.
It implies to be open from a PDPackageAnalyzerWindowPackageDependencies instance. 
"
Class {
	#name : #DAAddPackageModel,
	#superclass : #ComposableModel,
	#instVars : [
		'packageList',
		'buttonAddPackage',
		'packageAnalyzerTreeModel'
	],
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'ChristopheDemarey 9/11/2015 13:54'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn:
			[ :col | 
			col
				add: #packageList;
				add: #buttonAddPackage height: 30
				] yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>actionOnAddPackage [
	| relationGraph packagesToAdd |
	buttonAddPackage
		action: [ 
			self selectedItemsFromPackageList
				ifNotEmpty: [ 
					relationGraph := self packageAnalyzerTreeModel relationGraph.
					packagesToAdd := self selectedItemsFromPackageList
						collect: [ :packageName | (DAPackage on: (RPackageSet named: packageName)) beSeen ].
					relationGraph addPackages: packagesToAdd.
					self packageAnalyzerTreeModel
						refresh;
						resetDefaultSettings.
					self delete ] ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>buildList [
	| packagesAdded packagesNotAdded |
	packagesAdded := self packageAnalyzerTreeModel seenPackagesName.
	packagesNotAdded := self systemPackages.
	packagesNotAdded removeAll: packagesAdded.
	packageList items: packagesNotAdded.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>buttonAddPackage [
	^ buttonAddPackage
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>initialExtent [
	^ (600@600)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>initializePresenter [
	self actionOnAddPackage
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>initializeWidgets [
	
	packageList := self newList
		multiSelection: true;
		yourself.
	
	buttonAddPackage := self newButton
		help: 'Add these packages to the current analysis';
		label: 'Add packages';
		icon: (self iconNamed: #addIcon);
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>open [
	^ self openWithSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>packageAnalyzerTreeModel [
	^ packageAnalyzerTreeModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>packageAnalyzerTreeModel: aPackageAnalyzerTreeModel [
	packageAnalyzerTreeModel := aPackageAnalyzerTreeModel.
	self buildList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>packageList [
	^ packageList
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>selectedItemsFromPackageList [
	^ self packageList selectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>systemPackages [
	^ (RPackageOrganizer default packages collect: [ :package | package packageName asString ] )asSortedCollection
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAddPackageModel>>title [
	^ 'Choose packages to add'
]
