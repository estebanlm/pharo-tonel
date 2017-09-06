"
Two fingers are pinching
"
Class {
	#name : #OSTouchTwoFingersPinchMoveEvent,
	#superclass : #OSTouchTwoFingersPinchEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 8/24/2015 17:25'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersPinchMoveEvent>>accept: aVisitor [
	aVisitor visitTouchTwoFingersPinchMoveEvent: self
]
