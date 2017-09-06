"
A non-primary pointer has gone down.
"
Class {
	#name : #OSTouchActionPointerDownEvent,
	#superclass : #OSTouchActionPointerEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerDownEvent>>accept: aVisitor [
	^aVisitor visitTouchPointerDownEvent: self.
]
