"
A PDPackageAnalyzerTreeModel shows all dependent packages from a set of packages. Also you can see all type of the dependency, and browse them.
"
Class {
	#name : #DAPackageAnalyzerTreeModel,
	#superclass : #DAPackageTreeModel,
	#instVars : [
		'systemCycles',
		'packageLabel',
		'buttonBrowseCycles',
		'buttonDefault',
		'textPackageField',
		'filter',
		'buttonAddPackage',
		'buttonGenerateGraphViz',
		'buttonRemovePackage',
		'buttonReverseAnalysis',
		'buttonSave',
		'buttonMakeDiff',
		'relationGraph'
	],
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 6/12/2014 15:49'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn:
			[ :col | 
			col
				newRow: [ :row | 
							row
								add: #textPackageField;
								add: #buttonBrowseCycles;
								add: #buttonRefresh;
								add: #buttonDefault
								 ]
					height: 30;
				newRow: [ :row | 
							row
								add: #packageLabel ]
					height: 20;
				add: #tree;
				newRow: [ :row | 
							row
								add: #buttonAddPackage;
								add: #buttonRemovePackage;
								"add: #buttonGenerateGraphViz;"
								"add: #buttonMakeDiff;"
								add: #buttonReverseAnalysis
								 ]
					height: 30 ]	
					  yourself
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel class>>onPackages: aCollection [
	^ self new
		initializeWithRPackageSet: aCollection;
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel class>>onPackagesMatch: match [
	^ (self onPackagesNamed:
			(RPackageOrganizer default packages
				select: [ :package | match match: package packageName asString ]
				thenCollect: [ :package | package packageName ]) )
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel class>>onPackagesNamed: aCollection [
	^ self onPackages: (aCollection collect: [ :each | RPackageSet named: each ])
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnAddPackage [
	self buttonAddPackage action: [ (DAAddPackageModel 
					new 
					packageAnalyzerTreeModel: self)
					open ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnBrowseCycles [
	buttonBrowseCycles action: [ self actionOnFindCycles ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnButtons [

	self
		actionOnBrowseCycles;
		actionWhenTextFieldChanged;
		actionOnDefaultSettings;
		actionOnRemovePackage;
		actionOnAddPackage;
		 actionOnGenerateGraphViz;
		actionOnReverseAnalysis;
		actionOnSave.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnDefaultSettings [
	self buttonDefault
		action: [ 
			self resetDefaultSettings.
			self buildRoots ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnFindCycles [
	| selectedPackages selectedItems |
	selectedItems := self selectedItemsFromTree.
	(self arePackageNodes: selectedItems)
		ifTrue: [ 
			self notify: 'This could take a while, confirm?'.
			selectedPackages := self pdPackagesFrom: selectedItems.
			systemCycles ifNil: [ systemCycles := DAPackageAnalyzerCycleDetectionWindow  system ].
			systemCycles
				updateWithFilter: selectedPackages;
				open ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnGenerateGraphViz [
	| graphvizGenerator |
	buttonGenerateGraphViz
		action: [  
			self ifGraphVizAbsent: [ self error: 'Please install Graphviz Support' ].
			graphvizGenerator := DAPackageRelationGraphGenerator newWith: self relationGraph named: 'PackageDependencyGraph'.
			self saveGraphAndOpenWith: graphvizGenerator ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnRemovePackage [
	| packagesToRemove |
	self buttonRemovePackage
		action: [ 
			self selectedItemsFromTree
				ifNotEmpty: [ 
					packagesToRemove := self selectedItemsFromTree.
					packagesToRemove do: [ :item | self relationGraph removePackage: item content packageName ].
					self buildRoots ] ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnReverseAnalysis [
	buttonReverseAnalysis action: [ 
		(DAPackageAnalyzerPackageDependenciesWindow new 
						initializeWithRelationGraph: self relationGraph) 
					open ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionOnSave [
	self buttonSave 
		action: [ self saveCurrentRelationGraph ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>actionWhenTextFieldChanged [
	textPackageField
		whenTextChanged: [ 
			textPackageField text 
				ifEmpty: [ self resetFilter ]
				ifNotEmpty: [ self filter: textPackageField text ].
			self buildRoots ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buildRoots [
	| matching roots |
	self filter
		ifNotNil: [ 
			matching := '*' , self filter , '*'.
			roots := (self nodesFor: (relationGraph seenPackagesWithFilter: matching)) ]
		ifNil: [ roots := (self nodesFor: relationGraph seenPackages) ].
	self tree roots: roots.
	self updatePackageLabel.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buttonAddPackage [
	^ buttonAddPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buttonBrowseCycles [
	^ buttonBrowseCycles
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buttonDefault [
	^ buttonDefault
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buttonGenerateGraphViz [
	^ buttonGenerateGraphViz
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buttonMakeDiff [
	^ buttonMakeDiff
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buttonRemovePackage [
	^ buttonRemovePackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buttonReverseAnalysis [
	^ buttonReverseAnalysis
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>buttonSave [
	^ buttonSave
]

{
	#category : #saving,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>createDirectoryForSaving [
	| dir |
	dir := FileSystem workingDirectory / self defaultDirectory.
	dir ensureCreateDirectory
]

{
	#category : #saving,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>defaultDirectory [
	^ 'saving'
]

{
	#category : #saving,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>defaultName [
	^ self defaultDirectory, '/relationGraph.FL'
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>extent [
	^ 700@500
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>filter [
	^ filter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>filter: aString [
	filter := aString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>initializeButtons [
	buttonBrowseCycles := self newButton
		help: 'Find all the cycles where the package is in the system';
		label: 'Find cycles'.
	buttonDefault := self newButton
		help: 'Back to the default settings';
		label: 'Default settings'.
	buttonAddPackage := self newButton
		help: 'Add package to the current analysis';
		label: 'Add packages';
		icon: (Smalltalk ui icons iconNamed: #addIcon).
	buttonRemovePackage := self newButton
		help: 'Remove package to the current analysis';
		label: 'Remove packages';
		icon: (self iconNamed: #removeIcon).
	buttonGenerateGraphViz := self newButton
		help: 'Open the graph in world';
		label: 'Open the graph'.
	buttonReverseAnalysis := self newButton
		help: 'Reverse the analysis : set the dependent packages as root packages';
		label: 'Reverse the analysis'.
	buttonSave := self newButton
		help: 'Serialize the current object relation graph dependencies';
		label: 'Save current analysis'.
	buttonMakeDiff := self newButton 
		label: 'Make diff'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>initializePresenter [
	super initializePresenter.
	self actionOnButtons.
	tree
		whenSelectedItemChanged: [ :item |
			item
				ifNil: [ buttonBrowseCycles enabled: false ]
				ifNotNil: [ 
					buttonBrowseCycles enabled: true.
					tree menu: [ :aMenu | self loadMenuFor: item in: aMenu ].
					self tree selectedItem browseInNautilus ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>initializeWidgets [
	super initializeWidgets.
	
	packageLabel := self newLabel label: 'Analysis of packages'.
	
	textPackageField := self newTextInput
		ghostText: 'Enter a package name';
		entryCompletion: self packagesEntryCompletion.
	
	self initializeButtons
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>initializeWithRPackageSet: aCollection [
	self relationGraph: (DAPackageRelationGraph onPackages: (aCollection collect: [ :each | DAPackage on: each ]))
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>nodesFor: anItemList  [
	^ anItemList sorted collect: 
		[ :each | 
		DAPackageUnderAnalysisNode new
			content: each;
			cycle: false;
			treeModelParent: self;
			packageTreeNautilus: self packageTreeNautilus;
			packageTreeNautilusUI: self packageTreeNautilusUI;
			yourself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>packageLabel [
	^ packageLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>packagesEntryCompletion [
	| applicants |
	applicants := (RPackageOrganizer default packages collect: [ :package | package packageName asString ]).

	^ EntryCompletion new
				dataSourceBlock: [:currText | applicants];
				filterBlock: [:currApplicant :currText | currText size > 3
						and: [currApplicant asUppercase includesSubstring: currText asString asUppercase]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>pdPackagesFrom: selectedItems [
	^ selectedItems collect: [ :item | DAPackage on: (RPackageSet named: item content packageName asString) ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>refresh [
	self isOpen ifTrue: [  
			self relationGraph refreshGraph.
			self buildRoots].
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>relationGraph [
	^ relationGraph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>relationGraph: anObject [
	| warnings alertMessage |
	warnings := Set new.
	relationGraph := anObject.

	[ self relationGraph build ]
		on: PotentialOutDatedDependencyWarning 
		do: [ :ex | warnings add: ex. ex resume ].
	self buildRoots.
	alertMessage := 'Some dependencies declared in ' ,
		self relationGraph packagesName first,
		' Manifest as manuallyResolvedDependencies not detected as a dependency! Please check :' , String cr.
	warnings 	ifNotEmpty: [ 
		UIManager default 
			alert: alertMessage , (String cr join: (warnings collect: #dependency ))
			title: 'Potential outdated dependencies' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>relationGraphOnReverse: anObject [
	relationGraph := anObject.
	self relationGraph build.
	self buildReverseRoots
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>resetDefaultSettings [
	self resetFilter.
	self textPackageField text: ''
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>resetFilter [
	^ self filter: nil
]

{
	#category : #saving,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>saveCurrentRelationGraph [
	self createDirectoryForSaving.
	^  FLSerializer serialize: relationGraph toFileNamed: self defaultName. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>seenPackagesName [
	^ self relationGraph seenPackagesName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>sizeOfRoots [
	^ self treeRoots size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>textPackageField [
	^ textPackageField
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>title [
	^ 'Dependencies analysis'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>treeRoots [
	^ self tree roots
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerTreeModel>>updatePackageLabel [
	self packageLabel label: 'Analysis of ' , self sizeOfRoots asString , ' package(s)'
]
