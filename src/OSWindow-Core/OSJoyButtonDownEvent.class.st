"
This event is delivered when user pressing down a joystick button.
"
Class {
	#name : #OSJoyButtonDownEvent,
	#superclass : #OSJoyButtonEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'RonieSalgado 10/12/2014 17:49'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonDownEvent>>accept: aVisitor [
	^ aVisitor visitJoyButtonDownEvent: self
]
