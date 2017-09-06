"
Three fingers finished to scroll
"
Class {
	#name : #OSTouchThreeFingersScrollEndEvent,
	#superclass : #OSTouchThreeFingersScrollEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:16'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersScrollEndEvent>>accept: aVisitor [
	aVisitor visitTouchThreeFingersScrollEndEvent: self
]
