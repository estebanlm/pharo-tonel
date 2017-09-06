"
I'm a generic model for package tree nodes. 
"
Class {
	#name : #PackageTreeNodeModel,
	#superclass : #MorphTreeNodeModel,
	#category : #Nautilus-Tree,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeNodeModel>>= aNode  [
	^ (self class = aNode class) and:[ self item = aNode item]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeNodeModel>>asNautilusSelection [
	"Answers a pair RPackage->Tag to express the correct selection"
	^ self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeNodeModel>>asString [
	^ self item name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeNodeModel>>canBeRenamed [
	^ false
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeNodeModel>>doubleClick [
	"do not react"
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeNodeModel>>doubleClickEvent: anEvent onNodeMorph: aNodeMorph [
	(self canBeRenamed and: [ anEvent shiftPressed ])
		ifTrue:
			[ self model model selectedPackage: aNodeMorph complexContents item.
			self openFloatingEditorToRenameFromNodeMorph: aNodeMorph ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeNodeModel>>hash [
	^ self class hash bitXor: self item hash
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeNodeModel>>openFloatingEditorToRenameFromNodeMorph: aNodeMorph [
	| ed pkgMorph font element |
	element := aNodeMorph complexContents item.
	pkgMorph := aNodeMorph lastSubmorph.
	pkgMorph hasSubmorphs
		ifTrue: [ pkgMorph := pkgMorph lastSubmorph ].
	font := pkgMorph font.
	ed := RubFloatingEditorBuilder new
		customizeEditorWith:
				[ :editor | 
			| bnds |
			editor font: font.
			editor scrollbarsShowNever.
			bnds := pkgMorph topLeft - (2@0) extent: (aNodeMorph owner width - pkgMorph left) @ (aNodeMorph height).
			editor bounds: (aNodeMorph owner transform localBoundsToGlobal: bnds) ];
		withEditedContentsDo:
				[ :editedContents | 
			| newName |
			newName := editedContents asString trimBoth.
			(newName = element name asString or: [ newName isEmpty])
				ifFalse:
					[ [ element renameTo: newName ]
						on: RPackageConflictError
						do: [ ^ self inform: newName , ' already exists' ].
					self model model selectedPackage: element.
					self model model updatePackageView ] ].
	ed openEditorWithContents: element name asString thenDo: [ :editor | editor selectAll  ]
]
