"
This event is delivered when user releases previously pressed key
"
Class {
	#name : #OSKeyUpEvent,
	#superclass : #OSKeyboardEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:15'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSKeyUpEvent>>accept: aVisitor [
	^ aVisitor visitKeyUpEvent: self
]
