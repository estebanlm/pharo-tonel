"
Some strange event nobody knows what it does.??
"
Class {
	#name : #OSWindowFrameEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:33'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowFrameEvent>>accept: aVisitor [
	^ aVisitor visitWindowFrameEvent: self
]
