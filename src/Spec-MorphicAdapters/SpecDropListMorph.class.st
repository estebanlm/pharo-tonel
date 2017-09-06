"
I am a special DropList with icons
"
Class {
	#name : #SpecDropListMorph,
	#superclass : #DropListMorph,
	#instVars : [
		'currentIcon'
	],
	#category : #Spec-MorphicAdapters-Support,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDropListMorph>>getIconFor: anItem [

	^ self model getIconFor: anItem
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDropListMorph>>listHeight [
	"Answer the height for the list."

	^ super listHeight + 12
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDropListMorph>>listMorphClass [

	^ PluggableIconListMorph
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDropListMorph>>newListMorph [
	"Answer a new list morph"

	^ (self listMorphClass
		on: self
		list: #list
		selected: #listSelectionIndex
		changeSelected: #listSelectionIndex:
		menu: nil
		keystroke: nil)
			getIconSelector: #getIconFor:;
			autoDeselect: false;
			wrapSelector: #wrapItem:index:;
			roundedCorners: #(2 3);
			setProperty: #morphicLayerNumber toValue: 5;
			borderStyle: (self theme dropListNormalListBorderStyleFor: self);
			on: #mouseDown send: #listMouseDown: to: self;
			yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDropListMorph>>updateListSelectionIndex [

	currentIcon ifNotNil: [ self removeMorph: currentIcon ].
		
	super updateListSelectionIndex.
	
	self selectedItem ifNotNil: [ :item | 
		(self getIconFor: item) ifNotNil: [:icon | 
			currentIcon := icon asMorph.
			self addMorphFront: currentIcon ] ] 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDropListMorph>>wrapItem: anItem index: anIndex [

	^ self model wrapItem: anItem index: anIndex
]
