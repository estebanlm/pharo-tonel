"
I am the handler for the gestures.
As you can see instead of using #visitTouchPointerUpEvent: anEvent you have to use #visitTouchActionPointerUpEvent: anEvent
"
Class {
	#name : #OSWindowGestureEventHandler,
	#superclass : #OSWindowGestureHandler,
	#instVars : [
		'touchExample'
	],
	#category : #OSWindow-SDL2-Examples-Gesture,
	#timestamp : 'MerwanOuddane 7/23/2015 10:56'
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>touchExample: renderer [
	touchExample := renderer
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchActionPointerDownEvent: anEvent [
	touchExample beginMove: anEvent fingerId at: anEvent position
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchActionPointerMoveEvent: anEvent [
	touchExample move: anEvent fingerId at: anEvent position.
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchActionPointerUpEvent: anEvent [
	touchExample endMove: anEvent fingerId at: anEvent position.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchOneFingerDoubleTapEvent: anEvent [
	touchExample changeColors
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchOneFingerHoldEvent: anEvent [
	touchExample switchDiscoMode
]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchThreeFingersSwipeAbortEvent: anEvent [
	touchExample abortedSwipe.
]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchThreeFingersSwipeBeginEvent: anEvent [
	touchExample beginSwipe: anEvent
]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchThreeFingersSwipeEndEvent: anEvent [
	touchExample endSwipe: anEvent
]

{
	#category : #'visiting - three fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchThreeFingersSwipeMoveEvent: anEvent [
	touchExample swipe: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersPinchBeginEvent: anEvent [
	touchExample beginPinch: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersPinchEndEvent: anEvent [
	touchExample endPinch: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersPinchMoveEvent: anEvent [
	touchExample pinch: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersRotationBeginEvent: anEvent [
	touchExample beginRotation: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersRotationEndEvent: anEvent [
	touchExample endRotation: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersRotationMoveEvent: anEvent [
	touchExample rotation: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersScrollBeginEvent: anEvent [
	touchExample beginScroll: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersScrollEndEvent: anEvent [
	touchExample endScroll: anEvent
]

{
	#category : #'visiting - two fingers gestures',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitTouchTwoFingersScrollMoveEvent: anEvent [
	touchExample scroll: anEvent
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGestureEventHandler>>visitWindowCloseEvent: anEvent [
	touchExample destroy
]
