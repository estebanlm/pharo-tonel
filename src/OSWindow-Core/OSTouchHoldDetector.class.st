"
I am the abstract class for all the Hold gesture detectors
"
Class {
	#name : #OSTouchHoldDetector,
	#superclass : #OSTouchPunctualGestureDetector,
	#instVars : [
		'waitingTime',
		'maxDistanceTravelled',
		'process'
	],
	#classVars : [
		'MaxDistanceTravelled',
		'WaitingTime'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:08'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector class>>initialize [
	super initialize.
	MaxDistanceTravelled := 0.02.
	WaitingTime := 1000
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector class>>maxDistanceTravelled [
	^ MaxDistanceTravelled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector class>>maxDistanceTravelled: anObject [
	MaxDistanceTravelled := anObject
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector class>>maxDistanceTravelledSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #maxDistanceTravelled)
		target: self;
		label: 'Detection area (%)';
		description:
				'The area to consider the finger to be still';
		parent: #holdGesture
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector class>>touchHoldSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #holdGesture)
		label: 'Hold';
		parent: #touchGestures
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector class>>waitingTime [
	^ WaitingTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector class>>waitingTime: anObject [
	WaitingTime := anObject
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector class>>waitingTimeSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #waitingTime)
		target: self;
		label: 'Time to hold (ms)';
		description:
				'How long does a finger has to stay on the screen to be considered as holding';
		parent: #holdGesture
]

{
	#category : #creation,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector>>createHoldEvent [
	self subclassResponsibility
]

{
	#category : #creation,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector>>createWaitingProcess [
	^ [ 
	(Delay forMilliseconds: waitingTime) wait.
	(self activeFingers allSatisfy: [ :each | each totalDistanceTravelled < maxDistanceTravelled ])
		ifTrue: [ self sendToEventHandler: self createHoldEvent ] ] fork
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector>>initialize [
	super initialize.
	waitingTime := self class waitingTime.
	maxDistanceTravelled := self class maxDistanceTravelled.
	process := Process new terminate.
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector>>necessaryFingers [
	self subclassResponsibility
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector>>visitTouchPointerDownEvent: anEvent [
	super visitTouchPointerDownEvent: anEvent.
	eventHandler fingerCount = self necessaryFingers
		ifTrue: [  process := self createWaitingProcess ]
		ifFalse: [ process terminate ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchHoldDetector>>visitTouchPointerUpEvent: anEvent [
	super visitTouchPointerUpEvent: anEvent.
	process terminate
]
