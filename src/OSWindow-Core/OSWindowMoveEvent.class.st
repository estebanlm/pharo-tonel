"
I am delivered when window moved by user or OS/window manager.
"
Class {
	#name : #OSWindowMoveEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:34'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowMoveEvent>>accept: aVisitor [
	^ aVisitor visitWindowMoveEvent: self
]
