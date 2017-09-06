"
i a m the event handler linked to SDL2AthensDrawingExample
"
Class {
	#name : #OSWindowAthensDrawingExampleEventHandler,
	#superclass : #OSWindowAthensExampleEventHandler,
	#category : #OSWindow-SDL2-Examples-Basic,
	#timestamp : 'MerwanOuddane 8/21/2015 14:47'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowAthensDrawingExampleEventHandler>>visitMouseButtonPressEvent: anEvent [
	anEvent button = 1
		ifTrue: [ ^ athensExample startStrokeAt: anEvent position ].
	athensExample clearStrokes
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowAthensDrawingExampleEventHandler>>visitMouseButtonReleaseEvent: anEvent [
	athensExample endStroke
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowAthensDrawingExampleEventHandler>>visitMouseMoveEvent: anEvent [
	athensExample moveAt: anEvent position
]
