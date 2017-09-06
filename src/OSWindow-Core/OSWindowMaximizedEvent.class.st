"
I am delivered when the window got maximized.
"
Class {
	#name : #OSWindowMaximizedEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'MerwanOuddane 6/3/2015 15:16'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowMaximizedEvent>>accept: aVisitor [
	^ aVisitor visitWindowMaximizedEvent: self
]
