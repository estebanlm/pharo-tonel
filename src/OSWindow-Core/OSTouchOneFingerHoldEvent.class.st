"
One finger is down and has not moved on the screen
"
Class {
	#name : #OSTouchOneFingerHoldEvent,
	#superclass : #OSTouchHoldEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/17/2015 21:07'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneFingerHoldEvent>>accept: aVisitor [
	aVisitor visitTouchOneFingerHoldEvent: self
]
