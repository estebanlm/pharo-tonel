"
This event is delivered when user releases a previously pressed joystick button.
"
Class {
	#name : #OSJoyButtonUpEvent,
	#superclass : #OSJoyButtonEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'RonieSalgado 10/12/2014 17:49'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSJoyButtonUpEvent>>accept: aVisitor [
	^ aVisitor visitJoyButtonUpEvent: self
]
