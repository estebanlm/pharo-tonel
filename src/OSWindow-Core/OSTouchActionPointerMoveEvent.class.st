"
aFinger just move.
"
Class {
	#name : #OSTouchActionPointerMoveEvent,
	#superclass : #OSTouchActionPointerEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerMoveEvent>>accept: aVisitor [
	^aVisitor visitTouchPointerMoveEvent: self.
]
