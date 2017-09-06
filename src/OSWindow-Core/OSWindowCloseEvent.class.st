"
I am delivered when user closing the window.
The default action (unless suppressed) will also destroy the window.
"
Class {
	#name : #OSWindowCloseEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:30'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowCloseEvent>>accept: aVisitor [
	^ aVisitor visitWindowCloseEvent: self
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowCloseEvent>>defaultAction [
	window destroy
]
