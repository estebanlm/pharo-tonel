"
Superclass of all pinches events
"
Class {
	#name : #OSTouchPinchEvent,
	#superclass : #OSTouchComplexEvent,
	#instVars : [
		'dDist'
	],
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 4/2/2015 15:02'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchEvent class>>id [
	^ #pinch
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchEvent>>dDist [
	^ dDist
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchPinchEvent>>dDist: anObject [
	dDist := anObject
]
