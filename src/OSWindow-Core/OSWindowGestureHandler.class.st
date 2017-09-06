"
I am a handler who can manage gestures and provide them informations on past and current touch events
"
Class {
	#name : #OSWindowGestureHandler,
	#superclass : #OSWindowEventGestureVisitor,
	#instVars : [
		'fingers',
		'fingerCount',
		'registeredGestures',
		'devicesFingers',
		'lastUpdateTimestamp'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:05'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>fingerCount [
	^ fingerCount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>fingerCount: anObject [
	fingerCount := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>fingers [
	^ fingers
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>fingersFromDevice: id [
	^ devicesFingers at: id ifAbsent: [ ^ fingers values ]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>handleGestureEvent: anEvent [
	self handleEvent: anEvent.
	
	"Notifying gestures"
	self sendEventToGestures: anEvent
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>initialize [
	registeredGestures := OrderedCollection new.
	devicesFingers := Dictionary new.
	fingers := Dictionary new.
	fingerCount := 0.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>lastUpdateTimestamp [
	^ lastUpdateTimestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>lastUpdateTimestamp: anObject  [
	lastUpdateTimestamp := anObject 
]

{
	#category : #'detector registering',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>registerGesture: aGesture [
	registeredGestures add: aGesture.
	aGesture eventHandler: self
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>sendEventToGestures: anEvent [
	registeredGestures
		do: [ :gesture | gesture handleEvent: anEvent ]
]

{
	#category : #'handling fingers',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>trackFinger: anEvent [
	| newFingerTracker |
	"Creating a new finger tracker"
	newFingerTracker := OSTouchFingerTracker for: anEvent.
	
	"Registering it in the right places"
	fingers at: anEvent fingerId put: newFingerTracker.
	(devicesFingers at: anEvent deviceId ifAbsentPut: OrderedCollection new) add: newFingerTracker.
]

{
	#category : #'detector registering',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>unregisterGesture: anOSTouchGesture [
	registeredGestures remove: anOSTouchGesture 
]

{
	#category : #'handling fingers',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>untrackFinger: anEvent [
	| removedTracker |
	fingerCount := fingerCount - 1.
	removedTracker := fingers removeKey: anEvent fingerId ifAbsent: [ ^ self ].
	(devicesFingers at: anEvent deviceId) remove: removedTracker.
]

{
	#category : #'handling fingers',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>updateGesturesActiveFingers [
	registeredGestures do: [ :gesture | gesture activeFingers: (self fingersFromDevice: gesture deviceId) ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>visitTouchPointerDownEvent: anEvent [
	self trackFinger: anEvent.
	
	"Updating informations"
	fingerCount := fingerCount + 1 .
	lastUpdateTimestamp := anEvent timestamp.
	
	self updateGesturesActiveFingers.
	
	self sendEventToGestures: anEvent.
	
	self visitTouchActionPointerDownEvent: anEvent
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>visitTouchPointerMoveEvent: anEvent [
	| fingerTracker |
	fingerTracker := fingers at: anEvent fingerId ifAbsent: [ self trackFinger: anEvent].

	fingerTracker updateWithEvent: anEvent.
	lastUpdateTimestamp := anEvent timestamp.
	
	self sendEventToGestures: anEvent.

	self visitTouchActionPointerMoveEvent: anEvent
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowGestureHandler>>visitTouchPointerUpEvent: anEvent [
	self untrackFinger: anEvent.
	lastUpdateTimestamp := anEvent timestamp.
	self updateGesturesActiveFingers.
	self sendEventToGestures: anEvent.
	self visitTouchActionPointerUpEvent: anEvent
]
