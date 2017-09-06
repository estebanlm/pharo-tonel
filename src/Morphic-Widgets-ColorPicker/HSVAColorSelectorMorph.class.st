"
Colour selector featuring a saturation/volume area, hue selection strip and alpha selection strip.
"
Class {
	#name : #HSVAColorSelectorMorph,
	#superclass : #Morph,
	#instVars : [
		'hsvMorph',
		'aMorph'
	],
	#category : #Morphic-Widgets-ColorPicker,
	#timestamp : 'gvc 5/18/2007 12:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>aMorph [
	"Answer the value of aMorph"

	^ aMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>aMorph: anObject [
	"Set the value of aMorph"

	aMorph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>alphaSelected: aFloat [
	"The alpha has changed."

	self triggerSelectedColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>colorSelected: aColor [
	"A color has been selected. Set the base color for the alpha channel."

	self aMorph color: aColor.
	self triggerSelectedColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>defaultColor [
	"Answer the default color/fill style for the receiver."
	
	^Color transparent

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>hsvMorph [
	"Answer the value of hsvMorph"

	^ hsvMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>hsvMorph: anObject [
	"Set the value of hsvMorph"

	hsvMorph := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		extent: 180@168;
		changeTableLayout;
		cellInset: 4;
		aMorph: self newAColorMorph;
		hsvMorph: self newHSVColorMorph;
		addMorphBack: self hsvMorph;
		addMorphBack: self aMorph.
	self aMorph color: self hsvMorph selectedColor
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>newAColorMorph [
	"Answer a new alpha color morph."

	^AColorSelectorMorph new
		model: self;
		hResizing: #spaceFill;
		vResizing: #rigid;
		setValueSelector: #alphaSelected:;
		extent: 24@24
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>newHSVColorMorph [
	"Answer a new hue/saturation/volume color morph."

	^HSVColorSelectorMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		when: #colorSelected send: #colorSelected: to: self
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>selectedColor [
	"Answer the selected color."

	^self hsvMorph selectedColor alpha: self aMorph value
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>selectedColor: aColor [
	"Set the hue and sv components."

	self aMorph value: aColor alpha.
	self hsvMorph selectedColor: aColor asNontranslucentColor
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVAColorSelectorMorph>>triggerSelectedColor [
	"Trigger the event for the selected colour"

	self triggerEvent: #selectedColor with: self selectedColor
]
