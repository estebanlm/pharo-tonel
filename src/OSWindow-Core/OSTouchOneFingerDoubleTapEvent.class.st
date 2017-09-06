"
A finger tapped quickly two time at the same position
"
Class {
	#name : #OSTouchOneFingerDoubleTapEvent,
	#superclass : #OSTouchDoubleTapEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/13/2015 09:58'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneFingerDoubleTapEvent>>accept: aVisitor [
	aVisitor visitTouchOneFingerDoubleTapEvent: self
]
