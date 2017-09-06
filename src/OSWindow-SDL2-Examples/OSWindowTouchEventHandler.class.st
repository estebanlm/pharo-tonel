"
I am the basic event handler for the example
"
Class {
	#name : #OSWindowTouchEventHandler,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'touchExample'
	],
	#category : #OSWindow-SDL2-Examples-Touch,
	#timestamp : 'MerwanOuddane 8/24/2015 17:49'
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowTouchEventHandler>>touchExample:	renderer [
		touchExample := renderer
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowTouchEventHandler>>visitTouchPointerDownEvent: anEvent [
	touchExample beginMove: anEvent fingerId at: anEvent position.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowTouchEventHandler>>visitTouchPointerMoveEvent: anEvent [
	touchExample move: anEvent fingerId at: anEvent position
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowTouchEventHandler>>visitTouchPointerUpEvent: anEvent [
	touchExample endMove: anEvent fingerId at: anEvent position
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowTouchEventHandler>>visitWindowCloseEvent: anEvent [
	touchExample destroy
]
