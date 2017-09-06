"
I am a multi state button supporting icon.

I am used to render tab actions
"
Class {
	#name : #TabActionButtonMorph,
	#superclass : #MultistateButtonMorph,
	#instVars : [
		'icon'
	],
	#category : #Morphic-Widgets-Tabs-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabActionButtonMorph class>>forAction: anAction [

	^ self new
		forAction: anAction;
		yourself
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabActionButtonMorph>>drawOn: aCanvas [

	super drawOn: aCanvas.
	icon ifNil: [ ^ self ].
	icon form ifNil: [ ^ self ].
	aCanvas
		translucentImage: icon form
		at: self topLeft
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabActionButtonMorph>>forAction: anAction [
	| baseColor |
	
	baseColor := Smalltalk ui theme baseColor.
	self extent: anAction icon extent.
	
	self activeEnabledNotOverUpFillStyle: baseColor.
	
	self activeDisabledNotOverUpFillStyle: (self theme buttonDisabledFillStyleFor: self).
	self passiveEnabledNotOverUpFillStyle: baseColor.
	self passiveDisabledNotOverUpFillStyle: baseColor.
	
	self
		activeEnabledOverUpFillStyle: (self theme buttonMouseOverFillStyleFor: self);
		passiveEnabledOverUpFillStyle: (self theme buttonMouseOverFillStyleFor: self).
	
	self
		activeEnabledOverDownFillStyle: (self theme buttonPressedFillStyleFor: self);
		passiveEnabledOverDownFillStyle: (self theme buttonPressedFillStyleFor: self);
		addUpAction: [ anAction action value ];
		setBalloonText: anAction label;
		extent: 16@16.
		
	icon := anAction icon.
		
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabActionButtonMorph>>icon: anObject [
	
	icon := anObject
]
