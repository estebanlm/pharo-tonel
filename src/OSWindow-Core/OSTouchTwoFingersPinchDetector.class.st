"
I am detecting the pinches made with two fingers.
I send these event back to my handler: 
	- OSTouchTwoFingersPinchBeginEvent 
	- OSTouchTwoFingersPinchMoveEvent 
	- OSTouchTwoFingersPinchEndEvent 
"
Class {
	#name : #OSTouchTwoFingersPinchDetector,
	#superclass : #OSTouchPinchDetector,
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:21'
}

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersPinchDetector>>eventClassBeginGesture [
	^OSTouchTwoFingersPinchBeginEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersPinchDetector>>eventClassEndGesture [
	^ OSTouchTwoFingersPinchEndEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersPinchDetector>>eventClassMoveGesture [
	^ OSTouchTwoFingersPinchMoveEvent
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchTwoFingersPinchDetector>>necessaryFingers [
	^ 2
]
