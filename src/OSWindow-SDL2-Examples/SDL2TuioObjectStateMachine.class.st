"

"
Class {
	#name : #SDL2TuioObjectStateMachine,
	#superclass : #Object,
	#instVars : [
		'color',
		'position',
		'angle',
		'objectId',
		'objectNumber'
	],
	#category : #OSWindow-SDL2-Examples-Touch,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>angle [
	^ angle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>angle: anObject [
	angle := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>color [
	^color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>color: anObject [
	color := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>initialize [
	position := 0@0.
	color := Color random.
	angle := 0.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>objectId [
	^ objectId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>objectId: anObject [
	objectId := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>objectNumber [
	^ objectNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>objectNumber: anObject [
	objectNumber := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>position [
	^ position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TuioObjectStateMachine>>position: anObject [
	position := anObject
]
