"
Colour selector featuring a saturation/volume area and a hue selection strip.
"
Class {
	#name : #HSVColorSelectorMorph,
	#superclass : #Morph,
	#instVars : [
		'svMorph',
		'hMorph'
	],
	#category : #Morphic-Widgets-ColorPicker,
	#timestamp : 'gvc 5/18/2007 12:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>colorSelected: aColor [
	"A color has been selected. Make the hue match."

	"self hMorph value: aColor hue / 360.
	self svMorph basicColor: (Color h: aColor hue s: 1.0 v: 1.0)."
	self triggerEvent: #colorSelected with: aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>defaultColor [
	"Answer the default color/fill style for the receiver."
	
	^Color transparent

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>hMorph [
	"Answer the value of hMorph"

	^ hMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>hMorph: anObject [
	"Set the value of hMorph"

	hMorph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>hue: aFloat [
	"Set the hue in the range 0.0 - 1.0. Update the SV morph and hMorph."

	self hMorph value: aFloat.
	self svMorph color: (Color h: aFloat * 359.9 s: 1.0 v: 1.0)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		borderWidth: 0;
		changeTableLayout;
		cellInset: 4;
		listDirection: #leftToRight;
		cellPositioning: #topLeft;
		svMorph: self newSVColorMorph;
		hMorph: self newHColorMorph;
		addMorphBack: self svMorph;
		addMorphBack: self hMorph;
		extent: 192@152;
		hue: 0.5
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>newHColorMorph [
	"Answer a new hue color morph."

	^HColorSelectorMorph new
		model: self;
		setValueSelector: #hue:;
		hResizing: #rigid;
		vResizing: #spaceFill;
		extent: 36@36
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>newSVColorMorph [
	"Answer a new saturation/volume color morph."

	^SVColorSelectorMorph new
		extent: 152@152;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		when: #colorSelected send: #colorSelected: to: self
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>selectedColor [
	"Answer the selected color."

	^self svMorph selectedColor
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>selectedColor: aColor [
	"Set the hue and sv components."

	self hue: aColor hue / 360.
	self svMorph selectedColor: aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>svMorph [
	"Answer the value of svMorph"

	^ svMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
HSVColorSelectorMorph>>svMorph: anObject [
	"Set the value of svMorph"

	svMorph := anObject
]
