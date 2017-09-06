"
This event is delivered when user pressing down a key
"
Class {
	#name : #OSKeyDownEvent,
	#superclass : #OSKeyboardEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:14'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyDownEvent>>accept: aVisitor [
	^ aVisitor visitKeyDownEvent: self
]
