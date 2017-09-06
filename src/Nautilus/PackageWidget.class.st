"
PackageWidget is the basic implementation of a wiget managing Packages and Groups.

Note however that the design is ugly because it mixes UI and Model. 
All the code in this hierarchy is conceptually bogus and should be rewritten.
"
Class {
	#name : #PackageWidget,
	#superclass : #AbstractWidget,
	#instVars : [
		'packagesList',
		'packagesSelection',
		'groupsSelection'
	],
	#category : #Nautilus-Widgets,
	#timestamp : 'StephaneDucasse 11/11/2015 16:12'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>buildContents [
	packagesList buildContents
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>buildPackagesList [
	| treeModel |
	treeModel := PackageTreeModel new
		model: self model;
		yourself.
	packagesList := (MorphTreeMorph on: treeModel)
		multiSelection: true;
		dropEnabled: true;
		getMenuSelector: #menu:shifted:;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		doubleClickSelector: #doubleClickEvent:onNodeMorph:;
		yourself.
	treeModel announcer
		when: MorphTreeSelectionChanged
		do: [ :ann | self model selectedFromPackageGroupView: ann selection ].
	packagesList buildContents.
	self model selectedPackage ifNotNil: [ self model listSelectItem: self model selectedPackage ].
	^ packagesList
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>deselectAll [
	packagesList model deselectAll
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>doubleClick [
	self selectedNode ifNotNil: [ :n | n doubleClick ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>enabled: aTrue  [
	packagesList model enabled: aTrue
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>expandAllFromNode: aPackageTreePackageNodeModel  [
	packagesList model expandAllFromNode: aPackageTreePackageNodeModel 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>hasFocus [
	^ packagesList hasKeyboardFocus 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>initialize [

	super initialize.

	packagesList := nil.
	packagesSelection := Dictionary new.
	groupsSelection := Dictionary new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>packagesList [
	^ packagesList 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>packagesSelection [
	^ packagesSelection 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>removeShortcuts: aSymbol [
	self model removeShortcuts: aSymbol from: packagesList
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>resetGroupsSelection [
	groupsSelection removeAll
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>resetPackagesSelection [
	packagesSelection removeAll
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>scrollSelectionIntoView [
	packagesList scrollSelectionIntoView
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>selectGroup: aGroup [
	groupsSelection at: aGroup put: true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>selectItems: aCollection  [
	packagesList model selectItems: aCollection 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>selectPackage: aPackage [
	self packagesSelection at: aPackage put: true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>selectedGroup [
	^ self selectedGroups ifEmpty: [ nil ] ifNotEmpty: [ :col | col first ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>selectedGroups [

	| associations |
	associations := groupsSelection associations select: [:assoc | assoc value ].
	associations := associations collect: [:assoc | assoc key ].
	^ associations select: [:each | each notNil ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>selectedPackage [

	^ self selectedPackages ifEmpty: [ nil ] ifNotEmpty: [ :col | col first ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>selectedPackageGroup [
	^ self selectedPackage ifNil: [ self selectedGroup ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>selectedPackages [
	| associations |
	associations := packagesSelection associations select: [ :assoc | assoc value ].
	associations := associations collect: [ :assoc | assoc key ].
	^ associations select: [ :each | each notNil ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>setShortcuts: aSymbol [
	self model setShortcuts: aSymbol to: packagesList
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>takeKeyboardFocus [
	packagesList takeKeyboardFocus 
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>updateContentsWithPreviouslyExpanded: aCollection  [
	packagesList updateContentsWithPreviouslyExpanded: aCollection
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>updateList [
	packagesList model updateList
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageWidget>>updatePackageView [
	packagesList model changed:#rootNodes
]
