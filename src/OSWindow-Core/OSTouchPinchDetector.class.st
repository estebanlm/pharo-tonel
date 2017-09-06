"
I am the abstract class for all the Pinch gesture detectors
"
Class {
	#name : #OSTouchPinchDetector,
	#superclass : #OSTouchDirectionnalGestureDetector,
	#instVars : [
		'maxDistanceBetweenFingersLine',
		'fingersDistanceFromCenter'
	],
	#classVars : [
		'MaxDistanceBetweenFingersLine'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:24'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector class>>initialize [
	super initialize.
	MaxDistanceBetweenFingersLine := 0.2.
	MinDistanceBeforeDetection := 0.03
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector class>>maxDistanceBetweenFingersLine [
	^ MaxDistanceBetweenFingersLine
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector class>>maxDistanceBetweenFingersLine: aNumber [
	MaxDistanceBetweenFingersLine := aNumber
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector class>>maxDistanceBetweenFingersLineSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #maxDistanceBetweenFingersLine)
		target: self;
		label: 'Max distance between fingers lines (%)';
		description:
				'The maximum distance between the two lines formed by the fingers';
		parent: #pinchGesture
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector class>>minDistanceBeforeDetectionSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #minDistanceBeforeDetection)
		target: self;
		label: 'Minimal fingers distance crossed (%)';
		description:
				'The distance, in percentage of the screen, that a finger of both fingers needs to travel before event detection';
		parent: #pinchGesture
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector class>>touchPinchSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #pinchGesture)
		label: 'Pinch';
		parent: #touchGestures
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>areFingersLinesNotTooFarApart [
	| firstFinger secondFinger minDistance |
	firstFinger := self activeFingers first.
	secondFinger := self activeFingers last.
	minDistance := (firstFinger distanceFromLineFormedByFinger: secondFinger)
		min: (secondFinger distanceFromLineFormedByFinger: firstFinger).
	^ minDistance < maxDistanceBetweenFingersLine
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>beginConditions [
	^ super beginConditions
		and: [ self areFingersLinesNotTooFarApart
		and: [ self doesFingersGoesInOppositeDirection ]]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>createEventBeginning [
	fingersDistanceFromCenter := self fingersDistanceFromCenter.
	^ self eventClassBeginGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		dDist: self dDist;
		yourself
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>createEventDuringMove [
	^ self eventClassMoveGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		dDist: self dDist;
		yourself
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>createEventEnding [
	^ self eventClassEndGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		dDist: self dDist;
		yourself
]

{
	#category : #'event field',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>dDist [
	| oldDistance |
	oldDistance := fingersDistanceFromCenter.
	fingersDistanceFromCenter := self fingersDistanceFromCenter.
	^ fingersDistanceFromCenter - oldDistance
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>doesFingersGoesInOppositeDirection [
	| fingersDirection direction |
	fingersDirection := self activeFingers collect: [ :each | each direction ].

	"We suppose that the direction of the gesture is the same as the first finger"
	direction := fingersDirection first.

	"We remove the first so he can't be evaluated a second time"
	fingersDirection at: 1 put: nil.
	^ fingersDirection anySatisfy: [ :finger | finger = direction negated ]
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>eventClassBeginGesture [
	self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>eventClassEndGesture [
	self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>eventClassMoveGesture [
	self subclassResponsibility
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>fingersDistanceFromCenter [
	| centerOfAllFingers |
	centerOfAllFingers := self centerOfAllFingers.
	^ (self activeFingers collect: [ :each | centerOfAllFingers distanceTo: each lastPosition ]) sum
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchDetector>>initialize [
	super initialize.
	maxDistanceBetweenFingersLine := self class maxDistanceBetweenFingersLine.
]
