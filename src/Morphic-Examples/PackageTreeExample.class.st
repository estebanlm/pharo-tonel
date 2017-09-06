"
PackageTreeExample new open
"
Class {
	#name : #PackageTreeExample,
	#superclass : #MorphTreeModel,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : '<historical>'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageTreeExample class>>example [

	^PackageTreeExample new open
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageTreeExample>>defaultTreeMorph [
	^ super defaultTreeMorph
			doubleClickSelector: #doubleClick;
			nodeStringGetter: #asString;
			getMenuSelector: #menu:shifted:.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageTreeExample>>doubleClick [
	self selectedNode ifNotNil: [:n | n doubleClick]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageTreeExample>>keyStroke: anEvent from: aTreeMorph  [
	self selectedNode
		ifNotNil: [:current | current keyStroke: anEvent from: aTreeMorph]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageTreeExample>>menu: menu shifted: b  [
	"Set up the menu to apply to the receiver's, 
	honoring the #shifted boolean"
	self selectedNode ifNotNil: [:current | current menu: menu shifted: b].
	^ menu
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageTreeExample>>open [
	^ self openDialogWindowIn: World title: 'Packages'.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageTreeExample>>rootItems [
	^ RPackageOrganizer default packages 
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageTreeExample>>rootNodeClassFromItem: anItem [
	^ PackageNodeExample
]
