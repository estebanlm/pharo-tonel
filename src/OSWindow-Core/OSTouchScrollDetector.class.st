"
I am the abstract class for all the Scroll gesture detectors
"
Class {
	#name : #OSTouchScrollDetector,
	#superclass : #OSTouchOneDirectionGestureDetector,
	#instVars : [
		'directionAtBeginning',
		'persistentDirection'
	],
	#classVars : [
		'PersistentDirection'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:13'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector class>>initialize [
	super initialize.
	PersistentDirection := false
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector class>>minDistanceBeforeDetectionSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #minDistanceBeforeDetection)
		target: self;
		label: 'Minimal fingers distance crossed (%)';
		description:
				'The distance, in percentage of the screen, that both fingers needs to travel before event detection';
		parent: #scrollGesture
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector class>>persistentDirection [
	^ PersistentDirection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector class>>persistentDirection: anObject [
	PersistentDirection := anObject
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector class>>persistentDirectionSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #persistentDirection)
		target: self;
		label: 'Persitent scrolling';
		description:
				'Should the scroll be keeping his direction after started?';
		parent: #scrollGesture
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector class>>touchScrollSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #scrollGesture)
		label: 'Scroll';
		parent: #touchGestures
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>beginConditions [
	^ super beginConditions
		and: [ self isKeepingDirection ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>createEventBeginning [
	directionAtBeginning := direction.
	^ self eventClassBeginGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		dDist: self dDist;
		direction: direction;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		yourself
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>createEventDuringMove [
	^ self eventClassMoveGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		dDist: self dDist;
		direction: direction;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		yourself
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>createEventEnding [
	directionAtBeginning := 0@0.
	^ self eventClassEndGesture new
		timestamp: eventHandler lastUpdateTimestamp;
		dDist: self dDist;
		direction: direction;
		deviceId: deviceId;
		position: self centerOfAllFingers;
		yourself
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>eventClassBeginGesture [
	self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>eventClassEndGesture [
	self subclassResponsibility
]

{
	#category : #abstract,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>eventClassMoveGesture [
	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>initialize [
	super initialize.
	persistentDirection := self class persistentDirection.
	directionAtBeginning := 0@0.
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollDetector>>isKeepingDirection [
	^ persistentDirection not
		or: [	directionAtBeginning = (0 @ 0)
		or: [ direction abs = directionAtBeginning abs ] ]
]
