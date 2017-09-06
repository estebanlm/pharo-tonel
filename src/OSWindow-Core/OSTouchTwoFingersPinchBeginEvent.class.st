"
Two fingers started pinching
"
Class {
	#name : #OSTouchTwoFingersPinchBeginEvent,
	#superclass : #OSTouchTwoFingersPinchEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:14'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersPinchBeginEvent>>accept: aVisitor [
	aVisitor visitTouchTwoFingersPinchBeginEvent: self
]
