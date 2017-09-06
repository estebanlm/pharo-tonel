"
Superclass of all scrolls events
"
Class {
	#name : #OSTouchScrollEvent,
	#superclass : #OSTouchComplexEvent,
	#instVars : [
		'dDist',
		'direction'
	],
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 4/2/2015 15:03'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollEvent class>>id [
	^ #scroll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollEvent>>dDist [
	^ dDist
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollEvent>>dDist: anObject [
	dDist := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollEvent>>direction [
	^ direction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchScrollEvent>>direction: anObject [
	direction := anObject
]
