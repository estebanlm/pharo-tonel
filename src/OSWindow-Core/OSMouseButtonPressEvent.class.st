"
i am delivered when user presses a mouse button
"
Class {
	#name : #OSMouseButtonPressEvent,
	#superclass : #OSMouseButtonEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:23'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseButtonPressEvent>>accept: aVisitor [
	^ aVisitor visitMouseButtonPressEvent: self
]
