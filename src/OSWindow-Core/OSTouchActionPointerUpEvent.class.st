"
A non-primary pointer has gone up.
"
Class {
	#name : #OSTouchActionPointerUpEvent,
	#superclass : #OSTouchActionPointerEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerUpEvent>>accept: aVisitor [
	^ aVisitor visitTouchPointerUpEvent: self
]
