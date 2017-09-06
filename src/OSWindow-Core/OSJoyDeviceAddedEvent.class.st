"
I am a joystick device added event.

This event is generated when a joystick is connected to the computer.
"
Class {
	#name : #OSJoyDeviceAddedEvent,
	#superclass : #OSJoyDeviceEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'RonieSalgado 4/10/2016 01:43'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceAddedEvent>>accept: aVisitor [
	^ aVisitor visitJoyDeviceAddedEvent: self
]
