"
i am a abstract visitor for handling events.. 
serving just to cover complete protocol, which user(s) will need to implement in order to act as an OSWindow event handler.
"
Class {
	#name : #OSWindowEventVisitor,
	#superclass : #Object,
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:45'
}

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>handleEvent: anEvent [
	anEvent accept: self.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitJoyAxisEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitJoyButtonDownEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitJoyButtonUpEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitJoyDeviceAddedEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitJoyDeviceRemappedEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitJoyDeviceRemovedEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitKeyDownEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitKeyUpEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitMouseButtonPressEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitMouseButtonReleaseEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitMouseMoveEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitMouseWheelEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitTextInputEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitTouchPointerDownEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitTouchPointerMoveEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitTouchPointerUpEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitUnknownEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowCloseEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowDropEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowExposeEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowFocusInEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowFocusOutEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowFrameEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowMaximizedEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowMinimizedEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowMouseEnterEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowMouseLeaveEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowMoveEvent: anEvent [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowEventVisitor>>visitWindowResizeEvent: anEvent [

]
