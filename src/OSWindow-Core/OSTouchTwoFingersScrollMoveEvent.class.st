"
Two fingers are scrolling
"
Class {
	#name : #OSTouchTwoFingersScrollMoveEvent,
	#superclass : #OSTouchTwoFingersScrollEvent,
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 5/11/2015 15:16'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersScrollMoveEvent>>accept: aVisitor [
	aVisitor visitTouchTwoFingersScrollMoveEvent: self
]
