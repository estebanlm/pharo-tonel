"
I am delivered when mouse enters the area , covered by a window
"
Class {
	#name : #OSWindowMouseEnterEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:34'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowMouseEnterEvent>>accept: aVisitor [
	^ aVisitor visitWindowMouseEnterEvent: self
]
