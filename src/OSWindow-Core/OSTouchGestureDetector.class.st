"
I am an abstract class for the gestures detector, to work I have to register with an OSWindowGestureHandler
"
Class {
	#name : #OSTouchGestureDetector,
	#superclass : #OSWindowEventGestureVisitor,
	#instVars : [
		'deviceId',
		'activeFingers',
		'eventHandler'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:07'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector class>>onDeviceId: anInteger [
	^ self new deviceId: anInteger
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector class>>reinitializeAllSubclasses [
	"self reinitializeAllSubclasses"
	self allSubclassesDo: [ :each | each initialize ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector class>>touchGestureSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #touchGestures)
		parent: #appearance;
		label: 'Touch Gestures'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector>>activeFingers [
	^ activeFingers
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector>>activeFingers: anObject [
	activeFingers := anObject
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector>>centerOfAllFingers [
	| fingersPosition sum cpt |
	cpt := 0.
	sum := 0@0.
	
	fingersPosition := self activeFingers
		collect: [ :fingerTracker | fingerTracker lastPosition ].
		
	fingersPosition ifEmpty: [ ^ nil ].
	
	fingersPosition do: [ :point | sum := sum + point. cpt := cpt + 1 ].
	
	^ sum / cpt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector>>deviceId [
	^ deviceId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector>>deviceId: anInteger [
	deviceId := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector>>eventHandler [
	^ eventHandler
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector>>eventHandler: anObject [
	eventHandler := anObject
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureDetector>>sendToEventHandler: anEvent [
	eventHandler handleGestureEvent: anEvent
]
