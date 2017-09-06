"
Superclass of all rotation events
"
Class {
	#name : #OSTouchRotationEvent,
	#superclass : #OSTouchComplexEvent,
	#instVars : [
		'dTheta'
	],
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 4/8/2015 14:27'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationEvent class>>id [
	^ #rotate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationEvent>>dTheta [
	^ dTheta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchRotationEvent>>dTheta: anObject [
	dTheta := anObject
]
