"
A PDPackageAnalyzerWindow class is an abstract class.
It represents the UI merging the SpecTreeModel (package dependencies or cycles) and Nautilus UI.

The main feature is to browse automatically in the Nautilus when you click on a node (package or dependency).

"
Class {
	#name : #DAPackageAnalyzerWindow,
	#superclass : #StandardWindow,
	#instVars : [
		'packageAnalyzerTreeModel',
		'nautilus'
	],
	#category : #Tool-DependencyAnalyser-UI-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 11:53'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow class>>onPackagesNamed: aCollection [
	^ self new 
		initializeWithPackageNames: aCollection;
		yourself
]

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow class>>selectedPackagesFrom: aBuilder [
	| target selectedPackages |
	target := aBuilder model.
	selectedPackages := target selectedPackages collect: [ :rpackage | rpackage packageName asString ].
	^ selectedPackages
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow class>>systemPackages [
	^ RPackageOrganizer default packages collect: [ :package | package packageName asString ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>addAllMorph [
	| windowNautilus  windowTreeModel |
	windowNautilus := self buildNautilusWindow.	
	windowTreeModel := self buildMorphWindowForTreeModel.
	packageAnalyzerTreeModel packageTreeNautilusUI: self nautilusUI.
	self
		addMorph: windowNautilus frame: (0.4 @ 0 corner: 1 @ 1);
		addMorph:  (self panelMorphFrom: windowTreeModel) frame: (0 @ 0 corner: 0.4 @ 1).
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>buildMorphWindowForTreeModel [
	| specWindow |
	packageAnalyzerTreeModel
		open;
		delete.
	
	specWindow := self specWindowFrom: packageAnalyzerTreeModel.
	^ specWindow
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>buildNautilusWindow [
	| nautilusUI nautilusWindow |

	nautilusUI := NautilusUI on: nautilus.
	nautilus instVarNamed: 'ui' put: nautilusUI.
	nautilusWindow := NautilusWindow new model: nautilusUI.
	nautilusUI 
		addAll: nautilusWindow;
		window: nautilusWindow;
		setWindowTitle.
	^ nautilusWindow
]

{
	#category : #initialization-filter,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>buildandAddAllMorph [
	nautilus := packageAnalyzerTreeModel packageTreeNautilus.
	self addAllMorph
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>defaultLabel [
	^ 'Package Dependencies Analysis'
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>delete [
	self packageAnalyzerTreeModel close.
	^ super delete
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>initialExtent [
	^ (1500@800)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>nautilus [
	^ nautilus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>nautilusUI [
	^ nautilus ui
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>open [
	^ self openInWorld.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>packageAnalyzerTreeModel [
	^ packageAnalyzerTreeModel
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>panelMorphFrom: aSpecWindow [
	aSpecWindow submorphs
		do: [ :submorph | 
			(submorph isKindOf: PanelMorph)
				ifTrue: [ ^ submorph ] ].
	^ nil
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageAnalyzerWindow>>specWindowFrom: aSpec [
	| windowModel specWindow |
	windowModel := aSpec window.
	specWindow := windowModel window.
	^ specWindow
]
