"
I am the event handler linked to the SDL2JoystickExample
"
Class {
	#name : #OSWindowGenericRendererExampleEventHandler,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'example'
	],
	#category : #OSWindow-SDL2-Examples-Examples,
	#timestamp : 'RonieSalgado 4/10/2016 02:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExampleEventHandler>>example [
	^ example
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExampleEventHandler>>example: anObject [
	example := anObject
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExampleEventHandler>>visitWindowCloseEvent: anEvent [
	example destroy
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExampleEventHandler>>visitWindowExposeEvent: anEvent [
	example enqueueRender.
	anEvent suppressDefaultAction.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExampleEventHandler>>visitWindowFrameEvent: anEvent [
	example ifNotNil: [ example update: Time millisecondClockValue *0.001. ].
	example enqueueRender 
]
