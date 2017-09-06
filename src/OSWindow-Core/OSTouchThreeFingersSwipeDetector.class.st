"
I am detecting the scrolls made with two fingers.
I send these event back to my handler: 
	- OSTouchThreeFingersSwipeBeginEvent 
	- OSTouchThreeFingersSwipeMoveEvent 
	- OSTouchThreeFingersSwipeEndEvent 
	- OSTouchThreeFingersSwipeAbortEvent 
"
Class {
	#name : #OSTouchThreeFingersSwipeDetector,
	#superclass : #OSTouchSwipeDetector,
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:19'
}

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersSwipeDetector>>eventClassAbortGesture [
	^ OSTouchThreeFingersSwipeAbortEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersSwipeDetector>>eventClassBeginGesture [
	^ OSTouchThreeFingersSwipeBeginEvent
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersSwipeDetector>>eventClassEndGesture [
	^ OSTouchThreeFingersSwipeEndEvent 
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersSwipeDetector>>eventClassMoveGesture [
	^ OSTouchThreeFingersSwipeMoveEvent
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchThreeFingersSwipeDetector>>necessaryFingers [
	^ 3
]
