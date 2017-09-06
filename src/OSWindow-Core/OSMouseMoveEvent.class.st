"
i am delivered when user moves a mouse
"
Class {
	#name : #OSMouseMoveEvent,
	#superclass : #OSMouseEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:23'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseMoveEvent>>accept: aVisitor [
	^ aVisitor visitMouseMoveEvent: self
]
