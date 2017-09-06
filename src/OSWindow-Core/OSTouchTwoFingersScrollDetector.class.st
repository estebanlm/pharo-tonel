"
I am detecting the scrolls made with two fingers.
I send these event back to my handler: 
	- OSTouchTwoFingersScrollBeginEvent 
	- OSTouchTwoFingersScrollMoveEvent 
	- OSTouchTwoFingersScrollEndEvent 
"
Class {
	#name : #OSTouchTwoFingersScrollDetector,
	#superclass : #OSTouchScrollDetector,
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:20'
}

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersScrollDetector>>eventClassBeginGesture [
	^ OSTouchTwoFingersScrollBeginEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersScrollDetector>>eventClassEndGesture [
	^ OSTouchTwoFingersScrollEndEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersScrollDetector>>eventClassMoveGesture [
	^ OSTouchTwoFingersScrollMoveEvent
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersScrollDetector>>necessaryFingers [
	^ 2
]
