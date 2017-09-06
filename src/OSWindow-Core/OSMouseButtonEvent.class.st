"
i am the root of various mouse button events.
"
Class {
	#name : #OSMouseButtonEvent,
	#superclass : #OSMouseEvent,
	#instVars : [
		'button'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:22'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseButtonEvent>>button [
	
	^ button
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseButtonEvent>>button: anObject [
	
	button := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseButtonEvent>>isWheel [
	^ self button > 3
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseButtonEvent>>printOn: stream [
	super printOn: stream.
	stream space; nextPutAll: button asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseButtonEvent>>wheelDirection [
	"If button is wheel button (>3), answer direction (#up/#down)"
	^ self button = 4 
		ifTrue: [ #up ] 
		ifFalse: [ #down ]
]
