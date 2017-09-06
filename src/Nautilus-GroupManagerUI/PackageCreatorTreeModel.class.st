"
I am the model to manage packages selection to add them in groups
"
Class {
	#name : #PackageCreatorTreeModel,
	#superclass : #FilteredMorphTreeModel,
	#instVars : [
		'groups',
		'selectedElements'
	],
	#category : #Nautilus-GroupManagerUI,
	#timestamp : 'FranckWarlouzet 7/19/2015 18:44'
}

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>acceptDroppingMorph: transferMorph event: evt inMorph: listMorph [
	patternModel acceptEditsInView
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>add: aCollection into: aGroup [
	aGroup addPackages: aCollection
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>defaultTreeMorph [
	^ super defaultTreeMorph
		dragEnabled: true;
		nodeStringGetter: #name
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>dragTransferType [
	^ #SelectedPackage
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>dragTransferTypeForMorph: listMorph [
	^ self dragTransferType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>groups [
	^ groups
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>groups: anObject [
	groups := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>initialize [
	super initialize.
	selectedElements := OrderedCollection new
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>open [
	(DialogGroupManagerUI on: self)
		title: 'Group Manager' translated;
		openInWorld
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>patternModel [
	^ patternModel
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>remove: aCollection from: aGroup [
	aGroup removePackages: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>selectedElements [
	^ selectedElements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>selectedElements: anObject [
	selectedElements := anObject
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageCreatorTreeModel>>wantsDroppedMorph: transferMorph event: evt inMorph: listMorph [
	(transferMorph isKindOf: TransferMorph)
		ifFalse: [ ^ false ].
	^ true
]
