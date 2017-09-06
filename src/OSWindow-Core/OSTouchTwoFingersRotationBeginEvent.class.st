"
Two fingers had began to rotate
"
Class {
	#name : #OSTouchTwoFingersRotationBeginEvent,
	#superclass : #OSTouchTwoFingersRotationEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 4/21/2015 12:50'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersRotationBeginEvent>>accept: aVisitor [
	aVisitor visitTouchTwoFingersRotationBeginEvent: self
]
