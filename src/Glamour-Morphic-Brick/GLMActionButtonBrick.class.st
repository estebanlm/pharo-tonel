"
A GLMActionButtonBrick is a basic iconified action button without label that supports mouse click, hover and unhover actions.

action: with object argument to set on mouse clicked action.
hoverAction action: with object argument to set on mouse hover action.
unhoverAction: with object argument to set on mouse unhover action.

User can set normal icon and icon that will be used when action button is hovered with mouse sending:
icon: aForm
hoverIcon: aForm

Instance Variables
	clickAction:		<Object>
	hoverAction:		<Object>
	unhoverAction:		<Object>

clickAction
	- action on mouse clicked

hoverAction
	- action on mouse hovered

unhoverAction
	- action on mouse unhovered

"
Class {
	#name : #GLMActionButtonBrick,
	#superclass : #GLMInteractableBrick,
	#instVars : [
		'hoverAction',
		'unhoverAction',
		'clickAction'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Basic,
	#timestamp : 'AliakseiSyrel 3/22/2015 12:20'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick class>>exampleOpen [

	self gtExample openCenteredInBrickWindowLabeled: 'Action button example'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick class>>gtExample [
	<gtExample>
	<label: 'Action button with icon and dynamic background color'>
	
	^ self new
			action: [ :b | b gtDisplayString logCr ];
			hoverAction: [ :b | b gtDisplayString logCr ];
			icon: GLMUIThemeExtraIcons glamorousGrayCircleEmpty;
			hoverIcon: GLMUIThemeExtraIcons glamorousRedCircle;
			selectedColor: Color veryVeryLightGray whiter slightlyLighter;
			pressedColor: Color veryVeryLightGray;
			borderColor: Color veryVeryLightGray;
			borderWidth: 1;
			padding: 5
]

{
	#category : #action-button-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>action: anObject [

	clickAction := anObject
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>click: anEvent [
	
	clickAction ifNil: [ ^ false ].
	clickAction brickValue: self withEnoughArguments: { anEvent }.
	
	^ true
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>deselect: anEvent [
	super deselect: anEvent.
	
	unhoverAction ifNotNil: [ :a | a brickValue: self withEnoughArguments: { anEvent } ]
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>hShrinkWrap [

	self width: [
		self vPadding + 
		(self icon isNil & self hoverIcon isNil
			ifTrue: [ 0 ]
			ifFalse: [
				self icon
					ifNil: [ self hoverIcon width ]
					ifNotNil: [ 
						self hoverIcon
							ifNil: [ self icon width ]
							ifNotNil: [ self icon width max: self hoverIcon width ] ] ]) ]
]

{
	#category : #action-button-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>hoverAction: anObject [

	hoverAction := anObject
]

{
	#category : #action-button-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>hoverIcon [

	^ self selectedImage
]

{
	#category : #action-button-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>hoverIcon: anImage [

	self selectedImage: anImage.
	self doLayoutForce
]

{
	#category : #action-button-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>icon [

	^ self normalImage
]

{
	#category : #action-button-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>icon: anImage [

	self normalImage: anImage.
	self doLayoutForce
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>initialize [
	super initialize.
	
	self
		hShrinkWrap;
		vShrinkWrap;
		enable
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>select: anEvent [
	super select: anEvent.
	
	hoverAction ifNotNil: [ :a | a brickValue: self withEnoughArguments: { anEvent } ]
]

{
	#category : #action-button-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>unhoverAction: anObject [

	unhoverAction := anObject
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionButtonBrick>>vShrinkWrap [

	self height: [
		self vPadding + 
		(self icon isNil & self hoverIcon isNil
			ifTrue: [ 0 ]
			ifFalse: [
				self icon
					ifNil: [ self hoverIcon height ]
					ifNotNil: [ 
						self hoverIcon
							ifNil: [ self icon height ]
							ifNotNil: [ self icon height max: self hoverIcon height ] ] ]) ]
]
