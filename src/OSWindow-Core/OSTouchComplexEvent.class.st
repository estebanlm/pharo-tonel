"
I am a touch event composed by several others basic events. 

"
Class {
	#name : #OSTouchComplexEvent,
	#superclass : #OSTouchEvent,
	#instVars : [
		'position'
	],
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'MerwanOuddane 4/2/2015 15:02'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchComplexEvent class>>id [
	^ #default
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchComplexEvent>>position [
	^ position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchComplexEvent>>position: anObject [
	position := anObject
]
