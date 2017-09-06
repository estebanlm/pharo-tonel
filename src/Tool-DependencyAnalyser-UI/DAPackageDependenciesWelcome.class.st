"
Welcome user interface to browse dependencies packages. Availaible via tools menu.
"
Class {
	#name : #DAPackageDependenciesWelcome,
	#superclass : #ComposableModel,
	#instVars : [
		'packageLabel',
		'packageChosenLabel',
		'buttonOpen',
		'packageList',
		'packageChosenList',
		'buttonAddPackage',
		'buttonRemovePackage',
		'buttonAddAll',
		'buttonRemoveAll',
		'textPackageField'
	],
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 7/21/2014 11:03'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn:
			[ :col | 
			col
				newRow: [ :row | 
							row
								add: #packageLabel;
								add: #packageChosenLabel ]
					height: 30;
				newRow: [ :row | 
							row
								add: #textPackageField;
								add: #buttonOpen ]
					height: 30;
				newRow: [ :row | 
							row
								add: #packageList;
								add: #packageChosenList ];
				newRow: [ :row | 
							row
								add: #buttonAddAll;
								add: #buttonAddPackage;
								add: #buttonRemoveAll;
								add: #buttonRemovePackage ]
					height: 30 ] yourself
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome class>>menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #PackageDependencies)
		order: 0.21;
		parent: #Tools;
		label: 'Dependency Analyser';
		icon: (self iconNamed: #packageIcon);
		action: [ self new open ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>actionOnAddPackage [
	| itemsToAdd itemsChosen itemsAdded |
	buttonAddPackage
		action: [ 
			self selectedItemsFromPackageList
				ifNotEmpty: [ 
					itemsToAdd := self selectedItemsFromPackageList asOrderedCollection.
					itemsAdded := self itemsFromPackageChosenList asOrderedCollection.
					itemsChosen := self merge: itemsToAdd With: itemsAdded.
					self packageChosenList items: itemsChosen asSortedCollection.
					self updatePackageChosenLabel ] ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>actionOnOpen [
	buttonOpen
		action: [ 
			self itemsFromPackageChosenList
				ifNotEmpty: [ 
					(DAPackageAnalyzerPackageDependenciesWindow onPackagesNamed: self itemsFromPackageChosenList) open.
					 ] ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>actionOnRemovePackage [
	| itemsAdded |
	buttonRemovePackage
		action: [ 
			self selectedItemsFromPackageChosenList
				ifNotEmpty: [ 
					itemsAdded := self itemsFromPackageChosenList.
					self selectedItemsFromPackageChosenList do: [ :each | itemsAdded remove: each ].
					self packageChosenList items: itemsAdded.
					self packageChosenList resetSelection.
					self updatePackageChosenLabel ] ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>buildList [
	self packageList items: self systemPackages.
	self updateLabels
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>buttonAddAll [
	^ buttonAddAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>buttonAddPackage [
	^ buttonAddPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>buttonOpen [
	^ buttonOpen
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>buttonRemoveAll [
	^ buttonRemoveAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>buttonRemovePackage [
	^ buttonRemovePackage
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>filterPackageList [
	| match itemsMatching |
	textPackageField text
		ifEmpty: [ self packageList items: self systemPackages ]
		ifNotEmpty: [ 
			match := '*' , textPackageField text , '*'.
			itemsMatching := self systemPackages select: [ :package | match match: package ].
			self packageList items: itemsMatching asSortedCollection ]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>initialExtent [
	^ (800@800)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>initializeButtons [
	buttonOpen := self newButton
		help: 'Open the package dependencies analysis';
		label: 'Browse dependencies';
		icon: (self iconNamed: #packageIcon).
	buttonAddPackage := self newButton
		help: 'Add package to browse';
		label: 'Add package';
		icon: (self iconNamed: #addIcon).
	buttonAddAll := self newButton
		help: 'Add all packages';
		label: 'Add all';
		icon: (self iconNamed: #addIcon).
	buttonRemovePackage := self newButton
		help: 'Remove package to browse';
		label: 'Remove package';
		icon: (self icon: #deleteIcon).
	buttonRemoveAll := self newButton
		help: 'Remove all selected packages';
		label: 'Remove all';
		icon: (self icon: #deleteIcon)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>initializeLabels [
	packageLabel := self newLabel.
	packageChosenLabel := self newLabel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>initializeLists [
	packageList := self newList
		multiSelection: true;
		yourself.
	packageChosenList := self newList
		multiSelection: true;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>initializePresenter [
	self actionOnOpen;
		actionOnAddPackage;
		actionOnRemovePackage.
	
	self buttonAddAll action: [ self packageChosenList items: self packageList listItems. self updatePackageChosenLabel ].
	self buttonRemoveAll action: [ self packageChosenList items: #().  self updatePackageChosenLabel ].
		
	packageChosenList whenSelectedItemChanged: [ packageList resetSelection ].
	
	textPackageField
		whenTextChanged: [ self filterPackageList ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>initializeWidgets [
	self
		initializeLists;
		initializeLabels;
		initializeButtons;
		buildList.
		
	textPackageField := self newTextInput
		ghostText: 'Filter package by name';
		entryCompletion: self packagesEntryCompletion.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>itemsFromPackageChosenList [
	^ self packageChosenList listItems
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>merge: aCollection With: anOtherCollection [
	^ aCollection asSet
		addAll: anOtherCollection;
		yourself
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>open [
	^ self openWithSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>packageChosenLabel [
	^ packageChosenLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>packageChosenList [
	^ packageChosenList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>packageLabel [
	^ packageLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>packageList [
	^ packageList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>packagesEntryCompletion [
	| applicants |
	applicants := self systemPackages.

	^ EntryCompletion new
				dataSourceBlock: [:currText | applicants];
				filterBlock: [:currApplicant :currText | currText size > 3
						and: [currApplicant asUppercase includesSubstring: currText asString asUppercase]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>selectedItemsFromPackageChosenList [
	^ self packageChosenList selectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>selectedItemsFromPackageList [
	^ self packageList selectedItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>systemPackages [
	^ (RPackageOrganizer default packages collect: [ :package | package packageName asString ] )asSortedCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>textPackageField [
	^ textPackageField
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>title [
	^ 'Package Dependencies Browser'
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>updateLabels [
	self
		updatePackageLabel;
		updatePackageChosenLabel
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>updatePackageChosenLabel [
	self packageChosenLabel 
			label: packageChosenList listSize asString, ' package(s) chosen'.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependenciesWelcome>>updatePackageLabel [
	self packageLabel 
			label: 'Choose your packages (', self packageList listSize asString, ' packages available)'.
]
