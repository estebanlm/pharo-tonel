"
I am a joystick device remapped event.

This event is generated when a joystick layout is remapped.
"
Class {
	#name : #OSJoyDeviceRemappedEvent,
	#superclass : #OSJoyDeviceEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'RonieSalgado 4/10/2016 01:44'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceRemappedEvent>>accept: aVisitor [
	^ aVisitor visitJoyDeviceRemappedEvent: self
]
