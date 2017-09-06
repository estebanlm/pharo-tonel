"
I am recording all movements and informations from a finger
"
Class {
	#name : #OSTouchFingerTracker,
	#superclass : #Object,
	#instVars : [
		'fingerId',
		'deviceId',
		'delta',
		'pressure',
		'timestamp',
		'move',
		'firstPosition',
		'lastPosition'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 4/14/2015 10:00'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker class>>for: anEvent [
	^ self new deviceId: anEvent deviceId;
		fingerId: anEvent fingerId;
		delta: anEvent delta;
		firstPosition: anEvent position;
		pressure: anEvent pressure;
		timestamp: anEvent timestamp
]

{
	#category : #moves,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>addToMove: aPoint [
	move add: aPoint.
	lastPosition := aPoint
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>delta [
	^ delta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>delta: anObject [
	delta := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>deviceId [
	^ deviceId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>deviceId: anObject [
	deviceId := anObject
]

{
	#category : #calculating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>direction [
	"Only returns noth, east, west, south"
	^ delta x abs > delta y abs
		ifTrue: [ delta x sign @ 0 ]
		ifFalse: [ 0 @ delta y sign ]
]

{
	#category : #calculating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>distanceFromLineFormedByFinger: aFingerTracker [
	| otherLast |
	otherLast := aFingerTracker lastPosition.

	^ lastPosition distanceTo: 
		(lastPosition nearestPointAlongLineFrom: 
			otherLast + aFingerTracker delta 
		to:
			otherLast)
]

{
	#category : #calculating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>distanceTravelled [
	^ firstPosition distanceTo: lastPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>fingerId [
	^ fingerId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>fingerId: anObject [
	fingerId := anObject
]

{
	#category : #moves,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>firstPosition [
	^ firstPosition
]

{
	#category : #moves,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>firstPosition: anObject [
	move removeAll.
	firstPosition := anObject.
	self addToMove: firstPosition.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>initialize [
	move := OrderedCollection new.
]

{
	#category : #calculating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>isGettingCloserToPoint: aPoint [
	| rectangle |
	rectangle := lastPosition rectangle: aPoint.
	^ (rectangle containsPoint: lastPosition + delta)
]

{
	#category : #moves,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>lastPosition [
	^ lastPosition
]

{
	#category : #moves,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>lastPosition: anObject [
	lastPosition := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>move [
	^ move
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>move: anObject [
	move := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>pressure [
	^ pressure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>pressure: anObject [
	pressure := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>timestamp [
	^ timestamp 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>timestamp: anObject [
	timestamp := anObject
]

{
	#category : #calculating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>totalDistanceTravelled [
	| previous sum |
	previous := firstPosition.
	sum := 0.
	move
		do: [ :position | 
			sum := sum + position distanceTo: firstPosition.
			previous := position ].
	^ sum
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>updateDelta: aPoint [
	delta := (delta + (2 * aPoint)) / 3
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchFingerTracker>>updateWithEvent: anEvent [
	self updateDelta: anEvent delta;
		addToMove: anEvent position;
		pressure: anEvent pressure;
		timestamp: anEvent timestamp
]
