"
Three fingers are swiping
"
Class {
	#name : #OSTouchThreeFingersSwipeMoveEvent,
	#superclass : #OSTouchThreeFingersSwipeEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:19'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersSwipeMoveEvent>>accept: aVisitor [
	aVisitor visitTouchThreeFingersSwipeMoveEvent: self
]
