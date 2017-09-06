"
Two fingers stopped to scroll
"
Class {
	#name : #OSTouchTwoFingersScrollEndEvent,
	#superclass : #OSTouchTwoFingersScrollEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:17'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersScrollEndEvent>>accept: aVisitor [
	aVisitor visitTouchTwoFingersScrollEndEvent: self
]
