"
I am a wrapper used to display a morph with ahead an icon.

Here is the way to use me

IconicListItem new
	icon: ThemeIcons current smallOkIcon asMorph;
	morph: 'Accept' asMorph;
	yourself;
	openInWorld
"
Class {
	#name : #IconicListItem,
	#superclass : #BorderedMorph,
	#traits : 'TAbleToRotate',
	#classTraits : 'TAbleToRotate classTrait',
	#instVars : [
		'icon',
		'morph',
		'originalObject'
	],
	#category : #Morphic-Widgets-Basic,
	#timestamp : 'StephaneDucasse 7/16/2014 22:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem class>>text: aText icon: form [
	| morph |
	
	aText ifNotNil: [ morph := aText asMorph 
		lock;
		yourself ].

	^ self new
		morph:	morph;
		icon: form;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem>>enabled: aBoolean [

	self submorphs do: [ :each |
			each enabled: aBoolean ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem>>icon [
	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem>>icon: anObject [

	icon ifNotNil: [ self removeMorph: icon ].
	
	icon := anObject asAlphaImageMorph.
	anObject ifNotNil: [ "since the text can be removed" 
		self addMorphFront: icon.
		self adjustLayoutBounds]
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem>>initialize [

	super initialize.

	self 	
		changeTableLayout;
		listDirection: #leftToRight;
		cellPositioning: #center;
		cellInset: 2;
		borderWidth: 0;
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		extent: 20@16.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem>>morph [
	^ morph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem>>morph: anObject [
	
	morph ifNotNil: [ self removeMorph: morph ].
	morph := anObject.
	morph ifNotNil: [ "since the text can be removed" 
		self addMorphBack: morph.
		self adjustLayoutBounds]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem>>originalObject [

	^ originalObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
IconicListItem>>originalObject: anObject [
	
	originalObject := anObject
]
