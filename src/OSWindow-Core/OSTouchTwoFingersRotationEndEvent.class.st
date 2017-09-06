"
Two fingers had stopped to rotate
"
Class {
	#name : #OSTouchTwoFingersRotationEndEvent,
	#superclass : #OSTouchTwoFingersRotationEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:15'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersRotationEndEvent>>accept: aVisitor [
	aVisitor visitTouchTwoFingersRotationEndEvent: self
]
