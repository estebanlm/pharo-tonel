"
I detect gestures which needs all fingers to go on the same direction
"
Class {
	#name : #OSTouchOneDirectionGestureDetector,
	#superclass : #OSTouchDirectionnalGestureDetector,
	#instVars : [
		'direction'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:12'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneDirectionGestureDetector>>allFingersGoesInTheSameDirection [
	"We suppose that the direction of the gesture is the same as the first finger"
	direction := self activeFingers first direction.
	
	^ activeFingers allSatisfy: [ :finger | finger direction = direction ]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneDirectionGestureDetector>>beginConditions [
	^ super beginConditions and: [ self allFingersGoesInTheSameDirection ]
]

{
	#category : #'event field',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneDirectionGestureDetector>>dDist [
	| directionDDist |
	directionDDist := (self activeFingers collect: [ :each | each delta ])
		average * direction abs.
	^ directionDDist x + directionDDist y
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneDirectionGestureDetector>>direction [
	^ direction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneDirectionGestureDetector>>direction: anObject [
	direction := anObject
]
