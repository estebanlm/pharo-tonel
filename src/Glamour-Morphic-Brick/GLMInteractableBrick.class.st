"
A GLMInteractableBrick is a subclass of GLMBrick to allow user interactions such as: mouseLeave, mouseEnter, mouseDown, mouseUp and for each state can change background color or background image, that resizes accordinately to Brick's size. Supports doubleClick out of box, but it should be enabled sending enableDoubleClick message. When doubleClick is enabled announces #onDoubleClicked.

By default interactable brick is disabled and doesn't react to any user action. It should be first enabled sending enable message.

Instance Variables
	announcer:		<Announcer>
	checkedColor:		<Object>
	checkedImage:		<Object>
	isChecked:		<Boolean>
	isDoubleClickEnabled:		<Boolean>
	isEnabled:		<Boolean>
	isPressed:		<Boolean>
	isSelected:		<Boolean>
	normalColor:		<Object>
	normalImage:		<Object>
	pressedColor:		<Object>
	pressedImage:		<Object>
	selectedColor:		<Object>
	selectedImage:		<Object>

announcer
	- xxxxx

checkedColor
	- xxxxx

checkedImage
	- xxxxx

isChecked
	- xxxxx

isDoubleClickEnabled
	- xxxxx

isEnabled
	- xxxxx

isPressed
	- xxxxx

isSelected
	- xxxxx

normalColor
	- xxxxx

normalImage
	- xxxxx

pressedColor
	- xxxxx

pressedImage
	- xxxxx

selectedColor
	- xxxxx

selectedImage
	- xxxxx

"
Class {
	#name : #GLMInteractableBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'normalImage',
		'pressedImage',
		'selectedImage',
		'checkedImage',
		'announcer',
		'checkedColor',
		'normalColor',
		'pressedColor',
		'selectedColor',
		'isSelected',
		'isPressed',
		'isChecked',
		'isEnabled',
		'isDoubleClickEnabled'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Core,
	#timestamp : 'AliakseiSyrel 3/22/2015 11:38'
}

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>normalColorOf: aTrick [
	^ self pressedColor: false selectedColor: false of: aTrick
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>normalOf: aTrick [
	^ self pressed: false selected: false of: aTrick
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>pressed: isPressed of: aTrick [
	^ self pressed: isPressed selected: false of: aTrick
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>pressed: isPressed selected: isSelected checked: isChecked of: aTrick [
	"answers sender with image, corresponding specified state"
	
	"pressed has the highest priority"
	(isPressed & aTrick pressedImage notNil)
		ifTrue: [ ^ aTrick pressedImage ].
	
	(isChecked & aTrick checkedImage notNil)
		ifTrue: [ ^ aTrick checkedImage ].
		
	(((isPressed & aTrick pressedImage isNil) | isSelected) & aTrick selectedImage notNil)
		ifTrue: [ ^ aTrick selectedImage ].
	
	^ aTrick normalImage.
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>pressed: isPressed selected: isSelected of: aTrick [
	^ self pressed: isPressed selected: isSelected checked: false of: aTrick
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>pressedColor: isPressed of: aTrick [
	^ self pressedColor: isPressed selectedColor: false of: aTrick
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>pressedColor: isPressed selectedColor: isSelected checkedColor: isChecked of:aTrick [
	"answers sender with image, corresponding specified state"
	
	"pressed has the highest priority"
	(isPressed & aTrick pressedColor notNil)
		ifTrue: [ ^ aTrick pressedColor ].
		
	(isChecked & aTrick checkedColor notNil)
		ifTrue: [ ^ aTrick checkedColor ].
		
	(((isPressed & aTrick pressedColor isNil) | isSelected) & aTrick selectedColor notNil)
		ifTrue: [ ^ aTrick selectedColor ].

	
	^ aTrick normalColor.
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>pressedColor: isPressed selectedColor: isSelected of: aTrick [
	^ self pressedColor: isPressed selectedColor: isSelected checkedColor: false of: aTrick
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>selected: isSelected of: aTrick [
	^ self pressed: false selected: isSelected of: aTrick
]

{
	#category : #states,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick class>>selectedColor: isSelected of: aTrick [
	^ self pressedColor: false selectedColor: isSelected of: aTrick
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>check [
	"notifies #onChecked"
	self isChecked ifFalse: [
		isChecked := true.
		self announce: #onChecked.
		self changed ]
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>check: aBoolean [
	aBoolean
		ifTrue: [ self check ]
		ifFalse: [ self uncheck ]
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>checkedColor [
	^ checkedColor
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>checkedColor: anObject [
	checkedColor := anObject
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>checkedImage [
	^ checkedImage
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>checkedImage: anObject [
	checkedImage := anObject
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>click: anEvent [
	self announce: #onClicked event: anEvent.
	^ false
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>currentColor [
	^ self state pressedColor: (self isPressed) selectedColor: (self isSelected) checkedColor: (self isChecked) of: self
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>currentImage [
	^ self state pressed: (self isPressed) selected: (self isSelected) checked: (self isChecked) of: self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>defaultRenderer [
	^ GLMInteractableBrickRenderer new
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>depress [
	self isPressed ifTrue: [
		isPressed := false.
		self changed.
		^ true ].
	^ false
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>deselect [
	"notifies #onMouseUnhover"
	self isSelected ifTrue: [
		isSelected := false.
		self announce: #onMouseUnhover.
		self changed ]
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>deselect: anEvent [

	self deselect
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>disable [
	isEnabled := false.
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>doubleClick: anEvent [

	self announce: #onDoubleClicked event: anEvent.
	^ false
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>enable [
	
	isEnabled := true.
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>enable: aBoolean [
	
	isEnabled := aBoolean.
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>enableDoubleClick [

	isDoubleClickEnabled := true
]

{
	#category : #brick-morph-mouse-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>handlesMouseDown: evt [
	
	^ self isEnabled
		ifTrue: [ true ]
		ifFalse: [ super handlesMouseDown: evt ]
	
]

{
	#category : #brick-morph-mouse-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>handlesMouseOver: evt [
	^ self isEnabled
		ifTrue: [ true ]
		ifFalse: [ super handlesMouseDown: evt ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>initialize [
	super initialize.
	
	isChecked := false.
	isPressed := false.
	isSelected := false.
	
	self disable.
]

{
	#category : #brick-interactable-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>isChecked [
	^ isChecked.
]

{
	#category : #brick-interactable-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>isDoubleClickEnabled [

	^ isDoubleClickEnabled ifNil: [ isDoubleClickEnabled := false ]
]

{
	#category : #brick-interactable-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>isEnabled [
	^ isEnabled
]

{
	#category : #brick-interactable-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>isFocused [

	^ false
]

{
	#category : #brick-interactable-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>isHovered [
	^ self isSelected
]

{
	#category : #brick-interactable-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>isPressed [
	^ isPressed.
]

{
	#category : #brick-interactable-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>isSelected [
	^ isSelected.
]

{
	#category : #brick-morph-mouse-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>mouseDown: evt [
	|selectors|
	
	self isDoubleClickEnabled ifFalse: [
		super mouseDown: evt.
		^ self press ].
	
	selectors := Array
				with: #click:
				with: #doubleClick:
				with: #singleClick:
				with: nil.
				
	evt hand
		waitForClicksOrDrag: self
		event: evt
		selectors: selectors
		threshold: 10.

]

{
	#category : #brick-morph-mouse-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>mouseEnter: evt [
	super mouseEnter: evt.
	^ self select: evt
]

{
	#category : #brick-morph-mouse-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>mouseLeave: evt [
	super mouseLeave: evt.
	^ self deselect: evt
]

{
	#category : #brick-morph-mouse-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>mouseUp: evt [
	super mouseUp: evt.
	(self bounds containsPoint: evt position) & (self isPressed) ifTrue: [
		self depress.
		^ self click: evt
	] ifFalse: [
		self deselect: evt.
		^ self depress ]
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>normalColor [
	^ normalColor
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>normalColor: anObject [
	normalColor := anObject
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>normalImage [
	^ normalImage
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>normalImage: anObject [
	normalImage := anObject
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>press [
	self isPressed ifFalse: [
		isPressed := true.
		self changed.
	].

	^ false
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>pressedColor [
	^ pressedColor
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>pressedColor: anObject [
	pressedColor := anObject
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>pressedImage [
	^ pressedImage
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>pressedImage: anObject [
	pressedImage := anObject
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>select [
	"notifies #onMouseHover"
	self isSelected ifFalse: [ 
		isSelected := true.
		self announce: #onMouseHover.
		self changed ]
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>select: anEvent [

	self select
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>selectedColor [
	^ selectedColor
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>selectedColor: anObject [
	selectedColor := anObject
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>selectedImage [
	^ selectedImage
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>selectedImage: anObject [
	selectedImage := anObject
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>singleClick: anEvent [

	self announce: #onSingleClicked event: anEvent
]

{
	#category : #brick-interactable-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>state [

	^ self class
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMInteractableBrick>>uncheck [
	"notifies #onUnchecked"
	self isChecked ifTrue: [
		isChecked := false.
		self announce: #onUnchecked.
		self changed ]
]
