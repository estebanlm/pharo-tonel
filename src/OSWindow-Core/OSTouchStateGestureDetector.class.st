"
I am a gesture detector who detects gestures with a begin, current and end state
"
Class {
	#name : #OSTouchStateGestureDetector,
	#superclass : #OSTouchGestureDetector,
	#instVars : [
		'modeActivated'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:11'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>beginConditions [
	^ self hasGoodNumberOfFingers
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>createEventBeginning [
	self subclassResponsibility
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>createEventDuringMove [
	self subclassResponsibility 
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>createEventEnding [
	self subclassResponsibility 
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>hasGoodNumberOfFingers  [
	^ eventHandler fingerCount = self necessaryFingers
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>initialize [
	super initialize.
	modeActivated := false.
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>necessaryFingers [
	self subclassResponsibility
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>stayActiveConditions [
	^ self hasGoodNumberOfFingers
]

{
	#category : #'changing state',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>tryToEndGesture [
	self stayActiveConditions
		ifTrue: [ ^ self ].
	modeActivated := false.
	self sendToEventHandler: self createEventEnding
]

{
	#category : #'changing state',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>tryToGoThroughNextState [
	modeActivated
		ifTrue: [ self tryToEndGesture ]
		ifFalse: [ self tryToStartGesture ]
]

{
	#category : #'changing state',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>tryToStartGesture [
	self beginConditions ifFalse: [ ^self ].
	modeActivated := true.
	self sendToEventHandler: self createEventBeginning
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>visitTouchPointerDownEvent: anEvent [
	super visitTouchPointerDownEvent: anEvent.
	self tryToGoThroughNextState
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>visitTouchPointerMoveEvent: anEvent [
	super visitTouchPointerMoveEvent: anEvent.
	self tryToGoThroughNextState.
	(modeActivated and: [ self beginConditions ])
		ifTrue: [ self sendToEventHandler: self createEventDuringMove ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchStateGestureDetector>>visitTouchPointerUpEvent: anEvent [
	super visitTouchPointerUpEvent: anEvent.
	self tryToGoThroughNextState
]
