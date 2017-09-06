"
I represent a switch that can be either on or off.  I chnage my state in response to a mouse click.  When clicked, I also send my actionSelector to my target, just like a SimpleButtonMorph.

	SimpleSwitchMorph new openInWorld
"
Class {
	#name : #SimpleSwitchMorph,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'onColor',
		'offColor'
	],
	#category : #Morphic-Widgets-Basic-Buttons,
	#timestamp : 'StephaneDucasse 3/9/2012 12:45'
}

{
	#category : #button,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>doButtonAction [
	"Perform the action of this button. The last argument of the message sent to the target is the new state of this switch."

	| newState |
	(target notNil and: [actionSelector notNil]) 
		ifTrue: 
			[newState := color = onColor.
			target perform: actionSelector
				withArguments: (arguments copyWith: newState)]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>initialize [

	super initialize.
	self borderWidth: 3.
	self extent: self extent + 2.
	onColor := Color r: 1.0 g: 0.6 b: 0.6.
	offColor := Color lightGray.
	color := offColor

]

{
	#category : #switching,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>isOn [
	^ color = onColor
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>mouseDown: evt [

	oldColor := self fillStyle.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>mouseMove: evt [

	(self containsPoint: evt cursorPoint)
		ifTrue: [self setSwitchState: (oldColor = offColor)]
		ifFalse: [self setSwitchState: (oldColor = onColor)].

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>mouseUp: evt [

	(self containsPoint: evt cursorPoint)
		ifTrue: [  "toggle and do action"
			self setSwitchState: (oldColor = offColor).
			self doButtonAction]
		ifFalse: [  "restore old appearance"
			self setSwitchState: (oldColor = onColor)].

]

{
	#category : #switching,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>offColor: aColor [

	offColor := aColor.

]

{
	#category : #switching,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>onColor: aColor [

	onColor := aColor.

]

{
	#category : #switching,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>setSwitchState: aBoolean [

	aBoolean
		ifTrue: [self turnOn]
		ifFalse: [self turnOff].

]

{
	#category : #switching,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>toggleState [
	self isOn
		ifTrue: [self turnOff]
		ifFalse: [self turnOn]
]

{
	#category : #switching,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>turnOff [
	self borderColor: #raised.
	self color: offColor
]

{
	#category : #switching,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleSwitchMorph>>turnOn [
	self borderColor: #inset.
	self color: onColor
]
