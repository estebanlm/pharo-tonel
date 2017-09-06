"
I am detecting the scrolls made with three fingers.
I send these event back to my handler: 
	- OSTouchThreeFingersScrollBeginEvent 
	- OSTouchThreeFingersScrollMoveEvent 
	- OSTouchThreeFingersScrollEndEvent 
"
Class {
	#name : #OSTouchThreeFingersScrollDetector,
	#superclass : #OSTouchScrollDetector,
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:20'
}

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersScrollDetector>>eventClassBeginGesture [
	^ OSTouchThreeFingersScrollBeginEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersScrollDetector>>eventClassEndGesture [
	^ OSTouchThreeFingersScrollEndEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersScrollDetector>>eventClassMoveGesture [
	^ OSTouchThreeFingersScrollMoveEvent
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersScrollDetector>>necessaryFingers [
	^ 3
]
