"
An IdentityMorphTreeMorph is a MorphTreeMorph which always check for identity between items

"
Class {
	#name : #IdentityMorphTreeMorph,
	#superclass : #MorphTreeMorph,
	#category : #Nautilus-MorphTreeWidget-Extension,
	#timestamp : '<historical>'
}

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IdentityMorphTreeMorph>>expandedFormForMorph: aMorph [
	"Answer the form to use for expanded items."
	
	^ ((self selectedMorphList identityIncludes: aMorph) and: [self theme selectionColor luminance < 0.6])
		ifTrue: [self theme whiteTreeExpandedForm]
		ifFalse: [self theme treeExpandedForm]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IdentityMorphTreeMorph>>listManager: aManager [

	listManager := aManager
]

{
	#category : #expanding-collapsing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IdentityMorphTreeMorph>>notExpandedFormForMorph: aMorph [

	^ ((self selectedMorphList identityIncludes: aMorph) and: [self theme selectionColor luminance < 0.6])
		ifTrue: [self theme whiteTreeUnexpandedForm]
		ifFalse: [self theme treeUnexpandedForm]
]
