"
Superclass of all the pointer Event
	Can be a finger or something else.
"
Class {
	#name : #OSTouchActionPointerEvent,
	#superclass : #OSTouchActionEvent,
	#instVars : [
		'position',
		'delta',
		'pressure',
		'fingerId'
	],
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'jeanbaptistearnaud 2/26/2015 17:05'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerEvent>>delta [
	^ delta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerEvent>>delta: anObject [
	delta := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerEvent>>fingerId [
	^ fingerId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerEvent>>fingerId: anObject [
	fingerId := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerEvent>>position [
	^ position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerEvent>>position: anObject [
	position := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerEvent>>pressure [
	^ pressure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchActionPointerEvent>>pressure: anObject [
	pressure := anObject
]
