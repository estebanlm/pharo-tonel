"
I'm a tree model for managing groups, packages and tags.
"
Class {
	#name : #PackageTreeModel,
	#superclass : #MorphTreeModel,
	#instVars : [
		'model'
	],
	#category : #Nautilus-Tree,
	#timestamp : 'FranckWarlouzet 7/8/2015 16:54'
}

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>acceptDroppingMorph: aMorph event: evt inMorph: aTreeMorph [
	| target items |
	
	target := (aTreeMorph scrollerSubMorphFromPoint: evt position) complexContents item.
	items := aMorph passenger.
	target ifNotNil: [ 
		model 
			dropInAPackage: items 
			into: target ]
]

{
	#category : #'keyboard managing',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>arrowEvent: event key: aChar target: aMorph [
	"Transmit flow to next column"
	^ self model keyPressedOnTree: event target: aMorph.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>doubleClick [
	self selectedNode doubleClick
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>doubleClickEvent: anEvent onNodeMorph: aNodeMorph [
	self selectedNode ifNotNil: [ :n | n doubleClickEvent: anEvent onNodeMorph: aNodeMorph ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>groupIconFor: aPackage  [
	^ self model groupIconFor: aPackage.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>groupsAsNodes [
	^ (self model groups collect: [ :each | PackageTreePackageGroupNodeModel with: each model: self ])
		sorted: [ :a :b | a name < b name ]
]

{
	#category : #help-text,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>helpTextFor: aRPackage [
	"We try to get a configuration class with the same name of the package"

	| possibleConfigurationNames |
	aRPackage name ifEmpty: [ ^ nil ].
	possibleConfigurationNames := OrderedCollection new.
	(aRPackage name beginsWith: 'ConfigurationOf')
		ifTrue: [ possibleConfigurationNames addLast: aRPackage name ]
		ifFalse: [ 
			| stream |
			"'ConfigurationOf' size"
			stream := (String new: aRPackage name size + 15) writeStream.
			stream nextPutAll: 'ConfigurationOf'.
			$-
				split: aRPackage name
				do: [ :each | 
					(each = 'Core' or: [ each = 'Tests' ])
						ifFalse: [ 
							stream nextPutAll: each.
							possibleConfigurationNames addLast: stream contents ] ] ].
	"try longeset match first"
	possibleConfigurationNames
		reverseDo: [ :each |
			self class environment at: each asSymbol ifPresent: [ :configuration | 
					"If the configuration has a catalog description we show it, if not we don't"
					(configuration respondsTo: #catalogDescription)
						ifTrue: [ ^ configuration catalogDescription ]
						ifFalse: [ ^ nil ] ] ].
	^ nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>menu: menu shifted: b [
	^ self model menu: menu shifted: b
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>methodGroupAsNode [
	^ self model model class methodGroupManager groups
		collect: [ :each | PackageTreeMethodGroupNodeModel with: each model: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>model: anObject [
	model := anObject
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>okToChange [
	^ self model okToChange
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>packageIconFor: aPackage  [
	^ self model packageIconFor: aPackage.
]

{
	#category : #'package filter',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>packageMatchPattern: aRPackage  [
	
	^ self model packageMatchPattern: aRPackage
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>packagesAsNodes [
	^ (self model packages
		select: [ :each | (self packageMatchPattern: each) and: [ ((each name beginsWith: 'ConfigurationOf') or: [ each name beginsWith: 'BaselineOf' ]) not ] ]
		thenCollect: [ :each | each asNautilusNodeWithModel: self ]) sorted: [ :a :b | a name < b name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>rootNodes [
	^ self methodGroupAsNode , self groupsAsNodes , self packagesAsNodes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>tagIconFor: aTag  [
	^ nil
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeModel>>wantsDroppedMorph: aMorph event: anEvent inMorph: destMorph [
	"TODO: Filter out to avoid drag and drop of different objet types. Here, we don't know what the target may be so filtering is limited."

	aMorph dragTransferType ifNil: [ ^ false ].
	^ destMorph model == self
]
