"
I am delivered when window loses the user input focus.
"
Class {
	#name : #OSWindowFocusOutEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:32'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFocusOutEvent>>accept: aVisitor [
	^ aVisitor visitWindowFocusOutEvent: self
]
