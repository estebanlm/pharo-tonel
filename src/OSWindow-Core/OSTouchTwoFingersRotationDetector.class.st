"
I am detecting the rotations made with two fingers.
I send these event back to my handler: 
	- OSTouchTwoFingersRotationBeginEvent 
	- OSTouchTwoFingersRotationMoveEvent 
	- OSTouchTwoFingersRotationEndEvent 
"
Class {
	#name : #OSTouchTwoFingersRotationDetector,
	#superclass : #OSTouchRotationDetector,
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:24'
}

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersRotationDetector>>eventClassBeginGesture [
	^ OSTouchTwoFingersRotationBeginEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersRotationDetector>>eventClassEndGesture [
	^ OSTouchTwoFingersRotationEndEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersRotationDetector>>eventClassMoveGesture [
	^ OSTouchTwoFingersRotationMoveEvent
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersRotationDetector>>necessaryFingers [
	^ 2
]
