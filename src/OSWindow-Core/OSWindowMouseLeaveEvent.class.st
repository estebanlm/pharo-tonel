"
I am delivered when mouse leaves the area , covered by a window
"
Class {
	#name : #OSWindowMouseLeaveEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:34'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowMouseLeaveEvent>>accept: aVisitor [
	^ aVisitor visitWindowMouseLeaveEvent: self
]
