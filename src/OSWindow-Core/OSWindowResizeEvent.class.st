"
I am delivered when window resized by user or OS/window manager.
"
Class {
	#name : #OSWindowResizeEvent,
	#superclass : #OSWindowEvent,
	#instVars : [
		'width',
		'height'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:41'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowResizeEvent>>accept: aVisitor [
	^ aVisitor visitWindowResizeEvent: self
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowResizeEvent>>defaultAction [
	window renderer ifNotNil: [ :renderer | renderer resized ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowResizeEvent>>height [
	^ height
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowResizeEvent>>height: anInteger  [
	height := anInteger.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowResizeEvent>>width [
	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowResizeEvent>>width: anInteger  [
	width := anInteger.
]
