"
I am the root of the joystick button events hierarchy.

The which parameter identifies the joystick that produced this event.
The button parameter is the joystick dependent index of the button that was pressed or released.
The pressed parameter tells if the button was pressed or released.
The  mapped  parameters tells if the button index have been mapped into a standard controller layout.
The hasMapping parameters tells if this joystick is generating a mapped version of the event.
"
Class {
	#name : #OSJoyButtonEvent,
	#superclass : #OSEvent,
	#instVars : [
		'which',
		'button',
		'pressed',
		'mapped',
		'hasMapping'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'RonieSalgado 4/10/2016 06:40'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>button [
	
	^ button
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>button: anObject [
	
	button := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>hasMapping [
	^ hasMapping
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>hasMapping: anObject [
	hasMapping := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isButtonA [
	^ button == 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isButtonB [
	^ button == 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isButtonBack [
	^ button == 4
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isButtonGuide [
	^ button == 5
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isButtonStart [
	^ button == 6
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isButtonX [
	^ button == 2
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isButtonY [
	^ button == 3
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isDigitalPadDown [
	^ button == 12
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isDigitalPadLeft [
	^ button == 13
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isDigitalPadRight [
	^ button == 14
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isDigitalPadUp [
	^ button == 11
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isLeftShoulder [
	^ button == 9
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isLeftStick [
	^ button == 7
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isPreferredEvent [
	^ mapped or: hasMapping not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isRightShoulder [
	^ button == 10
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>isRightStick [
	^ button == 8
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>mapped [
	^ mapped
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>mapped: anObject [
	mapped := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>pressed [
	
	^ pressed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>pressed: anObject [
	
	pressed := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>which [
	
	^ which
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonEvent>>which: anObject [
	
	which := anObject
]
