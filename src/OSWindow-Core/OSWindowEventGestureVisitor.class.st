"
I am a abstract visitor for handling events.. 
serving just to cover the complete gesture protocol.
"
Class {
	#name : #OSWindowEventGestureVisitor,
	#superclass : #OSWindowEventVisitor,
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/23/2015 10:56'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>handleGestureEvent: anEvent [
	self handleEvent: anEvent.
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchActionPointerDownEvent: anEvent [
	"This event is only send when using the gesture detector"
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchActionPointerMoveEvent: anEvent [
	"This event is only send when using the gesture detector"
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchActionPointerUpEvent: anEvent [
	"This event is only send when using the gesture detector"
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchOneFingerDoubleTapEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchOneFingerHoldEvent: anEvent [

]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchThreeFingersScrollBeginEvent: anEvent [

]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchThreeFingersScrollEndEvent: anEvent [

]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchThreeFingersScrollMoveEvent: anEvent [

]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchThreeFingersSwipeAbortEvent: anEvent [
	
]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchThreeFingersSwipeBeginEvent: anEvent [

]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchThreeFingersSwipeEndEvent: anEvent [
	
]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchThreeFingersSwipeMoveEvent: anEvent [
	
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersPinchBeginEvent: anEvent [

]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersPinchEndEvent: anEvent [

]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersPinchMoveEvent: anEvent [

]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersRotationBeginEvent: anEvent [
	
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersRotationEndEvent: anEvent [
	
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersRotationMoveEvent: anEvent [
	
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersScrollBeginEvent: anEvent [

]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersScrollEndEvent: anEvent [

]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventGestureVisitor>>visitTouchTwoFingersScrollMoveEvent: anEvent [

]
