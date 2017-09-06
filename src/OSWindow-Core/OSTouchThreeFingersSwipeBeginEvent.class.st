"
Three fingers started to swipe
"
Class {
	#name : #OSTouchThreeFingersSwipeBeginEvent,
	#superclass : #OSTouchThreeFingersSwipeEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:18'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersSwipeBeginEvent>>accept: aVisitor [
	aVisitor visitTouchThreeFingersSwipeBeginEvent: self
]
