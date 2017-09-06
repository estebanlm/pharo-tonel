"
I am a joystick device event.

The which parameter gives the joystick index.
The  mapped  parameters tells if this device is axis and buttons are going to be mapped into a standard layout.
The hasMapping parameters tells if this joystick is generating a mapped version of the event.
"
Class {
	#name : #OSJoyDeviceEvent,
	#superclass : #OSEvent,
	#instVars : [
		'which',
		'mapped',
		'hasMapping'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'RonieSalgado 4/10/2016 06:39'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceEvent>>hasMapping [
	^ hasMapping
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceEvent>>hasMapping: anObject [
	hasMapping := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceEvent>>isPreferredEvent [
	^ mapped or: hasMapping not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceEvent>>mapped [
	^ mapped
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceEvent>>mapped: anObject [
	mapped := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceEvent>>which [
	^ which
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyDeviceEvent>>which: anObject [
	which := anObject
]
