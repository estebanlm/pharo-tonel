"
I am delivered when the window got minimized.
"
Class {
	#name : #OSWindowMinimizedEvent,
	#superclass : #OSWindowEvent,
	#category : #OSWindow-Core-Events,
	#timestamp : 'MerwanOuddane 6/3/2015 15:16'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowMinimizedEvent>>accept: aVisitor [
	^ aVisitor visitWindowMinimizedEvent: self
]
