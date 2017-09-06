"
Superclass of all swipes events
"
Class {
	#name : #OSTouchSwipeEvent,
	#superclass : #OSTouchComplexEvent,
	#instVars : [
		'dDist',
		'direction'
	],
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 4/8/2015 14:22'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchSwipeEvent class>>id [
	^ #swipe
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchSwipeEvent>>dDist [
	^ dDist
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchSwipeEvent>>dDist: anObject [
	dDist := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchSwipeEvent>>direction [
	^ direction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchSwipeEvent>>direction: anObject [
	direction := anObject
]
