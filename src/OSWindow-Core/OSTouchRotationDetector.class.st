"
I am the abstract class for all the Rotation gesture detectors
"
Class {
	#name : #OSTouchRotationDetector,
	#superclass : #OSTouchStateGestureDetector,
	#instVars : [
		'minAngleBeforeDetection',
		'vectorAtBeginnig',
		'lastAngle',
		'currentAngle'
	],
	#classVars : [
		'MinAngleBeforeDetection'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:25'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector class>>minAngleBeforeDetection [
	"I am the minimum angle, in degrees, required before the beginning of the rotation gesture"

	^ MinAngleBeforeDetection ifNil: [ 10 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector class>>minAngleBeforeDetection: anInteger [
	MinAngleBeforeDetection := anInteger
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector class>>minAngleBeforeDetectionSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #minAngleBeforeDetection)
		target: self;
		label: 'Minimal angle (degrees)';
		description:
				'Minimal angle, in degrees, that the fingers have to rotate before detection';
		parent: #rotationGesture
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector class>>touchRotationSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #rotationGesture)
		label: 'Rotation';
		parent: #touchGestures
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>beginConditions [
	^ super beginConditions and: [ self isBrinkAngleOverwhelmed ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>createEventBeginning [
	vectorAtBeginnig := self vectorBetweenFirstAndLastFingers.
	currentAngle := vectorAtBeginnig angleWith: self vectorBetweenFirstAndLastFingers.
	self updateCurrentAngle .
	
	^ self eventClassBeginGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		dTheta: 0;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		yourself
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>createEventDuringMove [
	^ self eventClassMoveGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		dTheta: currentAngle - lastAngle;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		yourself
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>createEventEnding [
	^ self eventClassEndGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		dTheta: currentAngle - lastAngle;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		yourself
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>eventClassBeginGesture [
	self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>eventClassEndGesture [
	self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>eventClassMoveGesture [
	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>initialize [
	super initialize.
	currentAngle := 0.0.
	minAngleBeforeDetection := self class minAngleBeforeDetection degreesToRadians
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>isBrinkAngleOverwhelmed [
	^ (currentAngle > (2 * Float pi - minAngleBeforeDetection) or: [ currentAngle < minAngleBeforeDetection ]) not
]

{
	#category : #update,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>updateCurrentAngle [
	lastAngle := currentAngle.
	currentAngle := vectorAtBeginnig angleWith: self vectorBetweenFirstAndLastFingers.
]

{
	#category : #calculating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>vectorBetweenFirstAndLastFingers [
	^ self activeFingers first lastPosition - self activeFingers last lastPosition
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>visitTouchPointerDownEvent: anEvent [
	super visitTouchPointerDownEvent: anEvent.
	eventHandler fingerCount = self necessaryFingers 
		ifTrue:[ vectorAtBeginnig := self vectorBetweenFirstAndLastFingers ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationDetector>>visitTouchPointerMoveEvent: anEvent [
	super visitTouchPointerMoveEvent: anEvent.
	eventHandler fingerCount = self necessaryFingers 
		ifTrue:[ self updateCurrentAngle ]
]
