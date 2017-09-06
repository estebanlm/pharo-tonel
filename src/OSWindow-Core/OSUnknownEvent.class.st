"
I am delivered , when driver don't knows how to interpret the event which comes from OS.
Useful for debugging.
"
Class {
	#name : #OSUnknownEvent,
	#superclass : #OSEvent,
	#instVars : [
		'data'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:25'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSUnknownEvent>>accept: aVisitor [
	^ aVisitor visitUnknownEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSUnknownEvent>>data [
	
	^ data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSUnknownEvent>>data: anObject [
	
	data := anObject
]
