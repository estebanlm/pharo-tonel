"
Two fingers finished to pinch
"
Class {
	#name : #OSTouchTwoFingersPinchEndEvent,
	#superclass : #OSTouchTwoFingersPinchEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:14'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersPinchEndEvent>>accept: aVisitor [
	aVisitor visitTouchTwoFingersPinchEndEvent: self
]
