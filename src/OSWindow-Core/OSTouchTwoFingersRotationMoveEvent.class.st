"
Two fingers are rotating
"
Class {
	#name : #OSTouchTwoFingersRotationMoveEvent,
	#superclass : #OSTouchTwoFingersRotationEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:15'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersRotationMoveEvent>>accept: aVisitor [
	aVisitor visitTouchTwoFingersRotationMoveEvent: self
]
