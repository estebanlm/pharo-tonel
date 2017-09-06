"
I am delivered when window obtains a user input focus.
"
Class {
	#name : #OSWindowFocusInEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:32'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFocusInEvent>>accept: aVisitor [
	^ aVisitor visitWindowFocusInEvent: self
]
