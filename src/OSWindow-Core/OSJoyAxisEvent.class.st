"
I am the  joystick axis event.

This event is generated when a joystick stick is moved.

The which parameter gives the joystick index.
The axis parameter is the index of the axis that moved.
The value parameter is how much the axis was moved.
The mapped parameter tells if the axis index has been mapped into the index of a standard layout.
The hasMapping parameters tells if this joystick is generating a mapped version of the event.
"
Class {
	#name : #OSJoyAxisEvent,
	#superclass : #OSEvent,
	#instVars : [
		'which',
		'axis',
		'value',
		'mapped',
		'hasMapping'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'RonieSalgado 4/10/2016 06:39'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>accept: aVisitor [
	^ aVisitor visitJoyAxisEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>axis [
	
	^ axis
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>axis: anObject [
	
	axis := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>hasMapping [
	^ hasMapping
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>hasMapping: anObject [
	hasMapping := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>isLeftX [
	^ axis == 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>isLeftY [
	^ axis == 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>isPreferredEvent [
	^ mapped or: hasMapping not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>isRightX [
	^ axis == 2
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>isRightY [
	^ axis == 3
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>isTriggerLeft [
	^ axis == 4
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>isTriggerRight [
	^ axis == 5
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>mapped [
	^ mapped
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>mapped: anObject [
	mapped := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>value [
	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>value: anObject [
	
	value := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>which [
	
	^ which
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyAxisEvent>>which: anObject [
	
	which := anObject
]
